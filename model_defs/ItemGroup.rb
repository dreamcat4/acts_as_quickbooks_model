# auto-generated from json definitions
module QBXML::Define

  module ItemGroup
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 31
        column :is_active, :boolean
        column :item_desc, :string, :limit => 4095
        column :unit_of_measure_set_ref_list_id, :string, :limit => 36
        column :unit_of_measure_set_ref_full_name, :string, :limit => 31
        column :is_print_items_in_group, :boolean
        column :special_item_type, :string
      end
    end
  end

end

