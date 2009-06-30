# auto-generated from json definitions
module QBXML::Define

  module Account
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
        column :account_type, :string
        column :detail_account_type, :string
        column :special_account_type, :string
        column :is_tax_account, :boolean
        column :account_number, :string, :limit => 7
        column :bank_number, :string, :limit => 25
        column :last_check_number, :string
        column :desc, :string, :limit => 200
        column :balance, :decimal, :precision => 9, :scale => 2
        column :total_balance, :decimal, :precision => 9, :scale => 2
        column :sales_tax_code_ref_list_id, :string, :limit => 36
        column :sales_tax_code_ref_full_name, :string, :limit => 3
        column :tax_line_info_ret_tax_line_id, :integer
        column :tax_line_info_ret_tax_line_name, :string, :limit => 256
        column :cash_flow_classification, :string
      end
    end
  end

end

