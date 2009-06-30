# auto-generated from json definitions
module QBXML::Define

  module InvoiceLine
    def define_columns
      return Proc.new do
        column :txn_line_id, :string, :limit => 36
        column :item_ref_list_id, :string, :limit => 36
        column :item_ref_full_name, :string
        column :desc, :string, :limit => 4095
        column :quantity, :decimal, :precision => 9, :scale => 2
        column :unit_of_measure, :string, :limit => 31
        column :override_uom_set_ref_list_id, :string, :limit => 36
        column :override_uom_set_ref_full_name, :string, :limit => 31
        column :rate, :decimal, :precision => 9, :scale => 2
        column :rate_percent, :decimal, :precision => 9, :scale => 2
        column :class_ref_list_id, :string, :limit => 36
        column :class_ref_full_name, :string, :limit => 159
        column :amount, :decimal, :precision => 9, :scale => 2
        column :service_date, :datetime
        column :sales_tax_code_ref_list_id, :string, :limit => 36
        column :sales_tax_code_ref_full_name, :string, :limit => 3
        column :is_taxable, :boolean
        column :other1, :string, :limit => 29
        column :other2, :string, :limit => 29
      end
    end
  end

end

