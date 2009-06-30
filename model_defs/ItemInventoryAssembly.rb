# auto-generated from json definitions
module QBXML::Define

  module ItemInventoryAssembly
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
        column :sales_desc, :string, :limit => 4095
        column :sales_price, :decimal, :precision => 9, :scale => 2
        column :income_account_ref_list_id, :string, :limit => 36
        column :income_account_ref_full_name, :string, :limit => 159
        column :purchase_desc, :string, :limit => 4095
        column :purchase_cost, :decimal, :precision => 9, :scale => 2
        column :purchase_tax_code_ref_list_id, :string, :limit => 36
        column :purchase_tax_code_ref_full_name, :string, :limit => 3
        column :cogs_account_ref_list_id, :string, :limit => 36
        column :cogs_account_ref_full_name, :string, :limit => 159
        column :pref_vendor_ref_list_id, :string, :limit => 36
        column :pref_vendor_ref_full_name, :string, :limit => 41
        column :asset_account_ref_list_id, :string, :limit => 36
        column :asset_account_ref_full_name, :string, :limit => 159
        column :build_point, :decimal, :precision => 9, :scale => 2
        column :quantity_on_hand, :decimal, :precision => 9, :scale => 2
        column :average_cost, :decimal, :precision => 9, :scale => 2
        column :quantity_on_order, :decimal, :precision => 9, :scale => 2
        column :quantity_on_sales_order, :decimal, :precision => 9, :scale => 2
      end
    end
  end

end

