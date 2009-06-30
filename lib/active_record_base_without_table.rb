module ActiveRecord
  module ConnectionAdapters
    class Column
      def initialize(name, type, options)
        options = Hash.new if options.nil?
        @name = name
        @type = @sql_type = type
        
        # remember :limit, :precision, :scale
        options.each do |key,value|
          eval "@#{key.to_s} = #{value}"
        end
      end
      
    end
  end
end

module ActiveRecord
  class BaseWithoutTable < Base
    def self.columns
      @columns ||= [];
    end
    
    def self.column(name, type=nil, options=nil)
      new_column = ActiveRecord::ConnectionAdapters::Column.new(name.to_s, type, options)
      columns << new_column
    end

    # The record can't be saved to db, but will remain in memory until rails quits
    # Override the save method to prevent exceptions.
    def save(validate = true)
      validate ? valid? : true
    end
  end
end
