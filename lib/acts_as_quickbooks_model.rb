require 'hpricot'
require 'libxml-bindings'
Dir["#{File.dirname(__FILE__)}/../model_maps/*"].each{ |model_map| load model_map }

# Note: These class overrides may break in a future version of activerecord.
module ActiveRecord #:nodoc:
  class XmlSerializerWithDecimalPrecisionScale < ActiveRecord::XmlSerializer #:nodoc:
    class Attribute < ActiveRecord::XmlSerializer::Attribute #:nodoc:      

      def observe_limit_precision_scale
        return if @value.nil?
        # when column :total_balance, :decimal, :precision => 9, :scale => 2
        column = @record.class.columns_hash[name]
        
        if column.type == :string && column.limit
            @value.slice!(column.limit-1..@value.length)
        end

        if column.type == :decimal && column.precision && column.scale
          max_allowed_value = 10 ** (column.precision - column.scale + 1) - 1.0/(10 ** column.scale)
          @value = max_allowed_value if @value > max_allowed_value # precision
          @value = "%.#{column.scale}f" % @value.to_s # scale
        end
      end

      def initialize(name, record)
        super
        observe_limit_precision_scale # when converting activerecord attributes to_xml
      end

    end

    # We redeclare here to override superclass call and point to new Attribute subclass
    def serializable_attributes
      serializable_attribute_names.collect { |name| Attribute.new(name, @record) }
    end
  end
end

module ActsAsQuickbooksModel
  def self.included(base)
    base.extend(ClassMethods)
    # base.extend(ValidationMethods)
  end

  module ClassMethods
    def acts_as_quickbooks_model(*args)
      model_classes = args.empty? ? [self] : args.to_a.collect {|class_name| Kernel.const_get(class_name)}
      
      # for acts_as_quickbooks_model "Model1" "Model2" ...
      model_classes.each do |model_class|
        model_name = model_class.to_s
        raise "Unsupported QBXML model type: #{model_type}" unless QBXML::ModelMaps.constants.include?(model_name)

        model_class.extend ValidationMethods

        if model_class.superclass.to_s == "ActiveRecord::BaseWithoutTable"
          define_table_columns_for model_name
          validates_limit_precision_scale # Is this needed for persistent records too?
        end

      end
      const_set('QUICKBOOKS_MODEL_TYPES', model_classes.collect {|c|c.to_s} )
      include InstanceMethods
    end
    
    def define_table_columns_for(model_name)
      load "#{File.dirname(__FILE__)}/../model_defs/#{model_name}.rb"
      eval "extend QBXML::Define::#{model_name}"
      define_columns.call
    end
  end
  
  module InstanceMethods

    def qbxml=(xml)
      puts "acts_as_quickbooks_model"
      puts "model_types=#{self.class.const_get('QUICKBOOKS_MODEL_TYPES')}"
      # build model_maps for all specified models
      qbxml_model_map = {}
      self.class.const_get('QUICKBOOKS_MODEL_TYPES').each do |model_type|
        qbxml_model_map.merge!(QBXML::ModelMaps.const_get(model_type))
      end
      
      # set qbxml attributes that exist in map and model
      model_qbxml_attributes = []
      qbxml_model_map.keys.each do |key|
        if self.respond_to?("#{key}=") && self.class.reflections[key.to_sym].nil?
          model_qbxml_attributes << key
        end
      end
      node = xml.respond_to?('innerHTML') ? xml : Hpricot.XML(xml).root
      
      model_qbxml_attributes.each do |a|
        element = node/"/#{qbxml_model_map[a.to_sym]}"
        next if element.nil? || element.empty?
        
        value = element.innerHTML.gsub('&amp;', '&').gsub('&apos;', "'")
        
        self.send("#{a}=", value)
      end
      
      # build has_many associations
      has_many_associations = self.class.reflections.dup.delete_if { |k,v| self.class.reflections[k].macro != :has_many }
      has_many_associations.each do |name,association_def|
        # search by has_many name and class_name
        possible_names = [ association_def.options[:class_name], name ].compact
        possible_names.each do |possible_name|
          search = possible_name.to_s.singularize.camelize
          node.search("> #{search}Ret|> #{search}Ref").each do |association_node|
            self.send(name).send(:build, :qbxml => association_node)
          end
        end
      end
    end
    
    # Utilize our own serializer subclass for tweaking the xml generation
    def to_xml(options = {}, &block)
      serializer = ActiveRecord::XmlSerializerWithDecimalPrecisionScale.new(self, options)
      block_given? ? serializer.to_s(&block) : serializer.to_s
    end

    def to_qbxml
      qbxml_model_map = {}
      self.class.const_get('QUICKBOOKS_MODEL_TYPES').each do |model_type|
        qbxml_model_map.merge!(QBXML::ModelMaps.const_get(model_type))
      end
      # Find the AR attributes which correspond to nested multi-level xml tags 
      qbxml_model_map.delete_if {|key, value| !value.include? "/" }

      # Generate rough xml
      qbxml = self.to_xml :camelize => true, :skip_types => true, :skip_instruct => true
      
      # walk through with libxml and re-write the nested tags
      # puts "=========libxml processing loop========="
      XML.default_keep_blanks = false
      root = qbxml.to_libxml_doc.root
      root.at("/Customer").each do |node|
        tag_name = node.name.underscore.to_sym
        
        if node.attributes["nil"]
          node.remove!
        elsif qbxml_model_map.has_key? tag_name
          # mapped_name = qbxml_model_map[tag_name]
          tags = qbxml_model_map[tag_name].split "/"
          # puts node.name
          # puts tag_name
          # puts mapped_name
          # tags.each do |tag|
          #   puts tag
          # end

          # rename toplevel node
          node.name = tags.first
          
          # create child node
          child = XML::Node.new(tags.last, node.content)

          # clear content in toplevel node
          node.content = ""

          # insert child node
          node << child
          
          # puts node.to_s
          # puts ""
        end
      end
      # puts "=="
      
            # qbxml = ""
      qbxml = root.to_s
      return qbxml
    end


  end
  
  module ValidationMethods
    
    def validates_limit_precision_scale
      validates_each self.column_names, :allow_nil => true do |record, attr_name, attr_value| 
        column = columns_hash[attr_name]
        if column.type == :string && column.limit
          record.errors.add(":string too long","length #{attr_value.length} exceeds :limit #{column.limit}") if attr_value.length > column.limit
        end
        if attr_value && column.type == :decimal && column.precision && column.scale
          max_value = 10 ** (column.precision - column.scale + 1) - 1.0/(10 ** column.scale)
          record.errors.add(":decimal too large","size #{attr_value} exceeds :precision #{column.precision} :scale #{column.scale}") if attr_value > max_value
        end
      end      
    end

  end

end

