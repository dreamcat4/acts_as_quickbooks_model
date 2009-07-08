require 'hpricot'
require 'libxml-bindings.rb'
require 'active_record'
require 'active_record/base'
require 'storable'
Dir["#{File.dirname(__FILE__)}/../model_maps/*"].each{ |model_map| load model_map }

module ActsAsQuickbooksModel
  def self.included(base)
    base.extend(ClassMethods)
    # base.extend(ValidationMethods)
  end

  class Config
    attr_reader :model_names
 
    def initialize(model_names)
      # Could replace this with a hash
      @model_names = model_names
    end
 
  end

  module ClassMethods
    def acts_as_quickbooks_config
      @acts_as_quickbooks_config || self.superclass.instance_variable_get('@acts_as_quickbooks_config')
    end
    
    def acts_as_quickbooks_model(*args)
      model_names = args.empty? ? [self.to_s] : args.to_a.map {|n| n.to_s}
      @acts_as_quickbooks_config = ActsAsQuickbooksModel::Config.new(model_names)
      
      # for acts_as_quickbooks_model "Model1" "Model2" ...
      model_names.each do |model_name|
        # puts "#{model_name}"
        # raise "Unsupported QBXML model type: #{model_name}" unless QBXML::ModelMaps.constants.include?(model_name)
        raise "Unsupported QBXML model type." unless QBXML::ModelMaps.constants.include?(model_name)

        # model_class.extend ValidationMethods
        self.extend ValidationMethods

        # if model_class.superclass.to_s == "ActiveRecord::BaseWithoutTable"
        if self.superclass.to_s == "ActiveRecord::BaseWithoutTable"
          define_table_columns_for model_name
          validates_limit_precision_scale # Is this needed for persistent records too?
        end

      end
      const_set('QUICKBOOKS_MODEL_TYPES', model_names )
      include InstanceMethods
    end
    
    def define_table_columns_for(model_name)
      load "#{File.dirname(__FILE__)}/../model_defs/#{model_name}.rb"
      eval "extend QBXML::Define::#{model_name}"
      define_columns.call
    end
    
  end
  
  module InstanceMethods
    def config
      return self.class.acts_as_quickbooks_config
    end
    
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
          # The following line may come unstuck on ListID
          search = possible_name.to_s.singularize.camelize
          node.search("> #{search}Ret|> #{search}Ref").each do |association_node|
            self.send(name).send(:build, :qbxml => association_node)
          end
        end
      end
    end
    
    def apply_limit_precision_scale(attribute_sym)
      # when column :total_balance, :decimal, :precision => 9, :scale => 2
      attr_name = attribute_sym.to_s
      attr_value = self[attr_name]
      column = self.class.columns_hash[attr_name]
      # column = self.columns_hash[name]
      # puts column.class
      if column.type == :string && column.limit
          attr_value.slice!(column.limit-1..attr_value.length)
      end

      if column.type == :decimal && column.precision && column.scale
        max_allowed_value = 10 ** (column.precision - column.scale + 1) - 1.0/(10 ** column.scale)
        attr_value = max_allowed_value if attr_value > max_allowed_value # precision
        attr_value = "%.#{column.scale}f" % attr_value.to_s # scale
      end
      return attr_value
    end
    
    def to_qbxml
      qbxml_model_map = {}
      XML.default_keep_blanks = false
      # XML.default_load_external_dtd = true
      # XML.default_tree_indent_string = ""
      XML.indent_tree_output = false
      # XML.default_validity_checking = true
      # XML.default_warnings = false

      doc = XML::Document.new
      config.model_names.each do |model_name|

        qbxml_model_map = (QBXML::ModelMaps.const_get(model_name))
        top_node = doc.last = XML::Node.new(model_name)
      
        qbxml_model_map.each do |model_key, model_val|
          # create node if AR attribute exists
          if self.attribute_present? model_key
          # if self.model_key? # || map to :has_many associations
            tags = model_val.split "/" || [model_val]
            node = top_node

            tags.each do |tag|
              next_node = node.at(tag)
              
              if next_node.nil?
                tag == tags.last ? content=apply_limit_precision_scale(model_key) : content=nil
                next_node = XML::Node.new(tag, "#{content}")
                puts "#{tag}#{content}"
                node << next_node
                node=next_node                
              else
                node=next_node
              end
            end
          end
        end
      end
      
      # puts "==============="
      # puts "config.model_names=#{config.model_names}\\end"
      # puts "config.model_names.class=#{config.model_names.class}\\end"
      # puts "==============="
      
      # <Customer>
      # <ListID>80000002-1245792458</ListID>
      # <TimeCreated>Tue Jun 23 23:27:38 +0100 2009</TimeCreated>
      # <TimeModified>Tue Jul 07 20:07:07 +0100 2009</TimeModified>
      # <EditSequence>1246990027</EditSequence>
      # <Name>More than 41 characters -------------890</Name>
      # <FullName>Old MacDonald</FullName>
      # <IsActive>true</IsActive>
      # <Sublevel>0</Sublevel>
      # <CompanyName>AMCE Corp</CompanyName>
      # <Salutation>Mr</Salutation>
      # <FirstName>Ant</FirstName>
      # <LastName>Eater</LastName>
      # <BillAddress><Addr2>Ant Eater</Addr2><Addr3>1 Ardvaark Road</Addr3><Addr4>Yellowstone Valley</Addr4><State>AZ</State><PostalCode>12345</PostalCode><Country>USA</Country></BillAddress>
      # <Addr1>AMCE Corp</Addr1>
      # <BillAddressBlock><Addr2>Ant Eater</Addr2><Addr3>1 Ardvaark Road</Addr3><Addr4>Yellowstone Valley</Addr4><Addr5>, AZ 12345 US</Addr5></BillAddressBlock>
      # <Email>ant.eater@amce.com</Email>
      # <Contact>Ant Eater</Contact>
      # <Balance>99999999.99</Balance>
      # <TotalBalance>9.23</TotalBalance>
      # <SalesTaxCountry>United States</SalesTaxCountry>
      # <JobStatus>None</JobStatus>
      # </Customer>
      
      qbxml = doc.root.to_s
      # qbxml.squeeze! " "
      return qbxml
    end
    
    alias_method :to_xml, :to_qbxml
    
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

