# auto-generated from json definitions
module QBXML::Define

  module ItemSalesTax
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 31
        column :is_active, :boolean
        column :is_used_on_purchase_transaction, :boolean
        column :item_desc, :string, :limit => 4095
        column :tax_rate, :decimal, :precision => 9, :scale => 2
        column :tax_vendor_ref_list_id, :string, :limit => 36
        column :tax_vendor_ref_full_name, :string, :limit => 41
        column :sales_tax_return_line_number, :string, :limit => 79
      end
    end
  end

end

