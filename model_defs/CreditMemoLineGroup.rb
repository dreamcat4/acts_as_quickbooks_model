# auto-generated from json definitions
module QBXML::Define

  module CreditMemoLineGroup
    def define_columns
      return Proc.new do
        column :txn_line_id, :string, :limit => 36
        column :item_group_ref_list_id, :string, :limit => 36
        column :item_group_ref_full_name, :string, :limit => 31
        column :desc, :string, :limit => 4095
        column :quantity, :decimal, :precision => 9, :scale => 2
        column :unit_of_measure, :string, :limit => 31
        column :override_uom_set_ref_list_id, :string, :limit => 36
        column :override_uom_set_ref_full_name, :string, :limit => 31
        column :is_print_items_in_group, :boolean
        column :total_amount, :decimal, :precision => 9, :scale => 2
        column :service_date, :datetime
      end
    end
  end

end

