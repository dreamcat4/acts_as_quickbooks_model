# auto-generated from json definitions
module QBXML::Define

  module ItemDiscount
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
        column :item_desc, :string, :limit => 4095
        column :sales_tax_code_ref_list_id, :string, :limit => 36
        column :sales_tax_code_ref_full_name, :string, :limit => 3
        column :discount_rate, :decimal, :precision => 9, :scale => 2
        column :discount_rate_percent, :decimal, :precision => 9, :scale => 2
        column :account_ref_list_id, :string, :limit => 36
        column :account_ref_full_name, :string, :limit => 159
      end
    end
  end

end

