# auto-generated from json definitions
module QBXML::Define

  module SalesTaxCode
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 3
        column :is_active, :boolean
        column :is_taxable, :boolean
        column :desc, :string, :limit => 31
        column :item_purchase_tax_ref_list_id, :string, :limit => 36
        column :item_purchase_tax_ref_full_name, :string, :limit => 31
        column :item_sales_tax_ref_list_id, :string, :limit => 36
        column :item_sales_tax_ref_full_name, :string, :limit => 31
      end
    end
  end

end

