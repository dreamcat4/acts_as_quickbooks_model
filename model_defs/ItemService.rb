# auto-generated from json definitions
module QBXML::Define

  module ItemService
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 31
        column :full_name, :string, :limit => 159
        column :is_active, :boolean
        column :parent_ref_list_id, :string, :limit => 36
        column :parent_ref_full_name, :string
        column :sublevel, :integer
        column :unit_of_measure_set_ref_list_id, :string, :limit => 36
        column :unit_of_measure_set_ref_full_name, :string, :limit => 31
        column :is_tax_included, :boolean
        column :sales_tax_code_ref_list_id, :string, :limit => 36
        column :sales_tax_code_ref_full_name, :string, :limit => 3
        column :sales_or_purchase_desc, :string, :limit => 4095
        column :sales_or_purchase_price, :decimal, :precision => 9, :scale => 2
        column :sales_or_purchase_price_percent, :decimal, :precision => 9, :scale => 2
        column :sales_or_purchase_account_ref_list_id, :string, :limit => 36
        column :sales_or_purchase_account_ref_full_name, :string, :limit => 159
        column :sales_and_purchase_sales_desc, :string, :limit => 4095
        column :sales_and_purchase_sales_price, :decimal, :precision => 9, :scale => 2
        column :sales_and_purchase_income_account_ref_list_id, :string, :limit => 36
        column :sales_and_purchase_income_account_ref_full_name, :string, :limit => 159
        column :sales_and_purchase_purchase_desc, :string, :limit => 4095
        column :sales_and_purchase_purchase_cost, :decimal, :precision => 9, :scale => 2
        column :sales_and_purchase_purchase_tax_code_ref_list_id, :string, :limit => 36
        column :sales_and_purchase_purchase_tax_code_ref_full_name, :string, :limit => 3
        column :sales_and_purchase_expense_account_ref_list_id, :string, :limit => 36
        column :sales_and_purchase_expense_account_ref_full_name, :string, :limit => 159
        column :sales_and_purchase_pref_vendor_ref_list_id, :string, :limit => 36
        column :sales_and_purchase_pref_vendor_ref_full_name, :string, :limit => 41
      end
    end
  end

end

