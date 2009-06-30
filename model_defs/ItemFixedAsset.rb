# auto-generated from json definitions
module QBXML::Define

  module ItemFixedAsset
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 31
        column :is_active, :boolean
        column :acquired_as, :string
        column :purchase_desc, :string, :limit => 50
        column :purchase_date, :datetime
        column :purchase_cost, :decimal, :precision => 9, :scale => 2
        column :vendor_or_payee_name, :string, :limit => 50
        column :asset_account_ref_list_id, :string, :limit => 36
        column :asset_account_ref_full_name, :string, :limit => 159
        column :fixed_asset_sales_info_sales_desc, :string, :limit => 50
        column :fixed_asset_sales_info_sales_date, :datetime
        column :fixed_asset_sales_info_sales_price, :decimal, :precision => 9, :scale => 2
        column :fixed_asset_sales_info_sales_expense, :decimal, :precision => 9, :scale => 2
        column :asset_desc, :string, :limit => 50
        column :location, :string, :limit => 50
        column :po_number, :string, :limit => 30
        column :serial_number, :string, :limit => 30
        column :warranty_exp_date, :datetime
        column :notes, :string, :limit => 4095
        column :asset_number, :string, :limit => 10
        column :cost_basis, :decimal, :precision => 9, :scale => 2
        column :year_end_accumulated_depreciation, :decimal, :precision => 9, :scale => 2
        column :year_end_book_value, :decimal, :precision => 9, :scale => 2
      end
    end
  end

end

