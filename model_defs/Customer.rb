# auto-generated from json definitions
module QBXML::Define

  module Customer
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 41
        column :full_name, :string, :limit => 209
        column :is_active, :boolean
        column :parent_ref_list_id, :string, :limit => 36
        column :parent_ref_full_name, :string
        column :sublevel, :integer
        column :company_name, :string, :limit => 41
        column :salutation, :string, :limit => 15
        column :first_name, :string, :limit => 25
        column :middle_name, :string, :limit => 5
        column :last_name, :string, :limit => 25
        column :suffix, :string
        column :bill_address_addr1, :string, :limit => 41
        column :bill_address_addr2, :string, :limit => 41
        column :bill_address_addr3, :string, :limit => 41
        column :bill_address_addr4, :string, :limit => 41
        column :bill_address_addr5, :string, :limit => 41
        column :bill_address_city, :string, :limit => 31
        column :bill_address_state, :string, :limit => 21
        column :bill_address_postal_code, :string, :limit => 13
        column :bill_address_country, :string, :limit => 31
        column :bill_address_note, :string, :limit => 41
        column :bill_address_block_addr1, :string, :limit => 41
        column :bill_address_block_addr2, :string, :limit => 41
        column :bill_address_block_addr3, :string, :limit => 41
        column :bill_address_block_addr4, :string, :limit => 41
        column :bill_address_block_addr5, :string, :limit => 41
        column :ship_address_addr1, :string, :limit => 41
        column :ship_address_addr2, :string, :limit => 41
        column :ship_address_addr3, :string, :limit => 41
        column :ship_address_addr4, :string, :limit => 41
        column :ship_address_addr5, :string, :limit => 41
        column :ship_address_city, :string, :limit => 31
        column :ship_address_state, :string, :limit => 21
        column :ship_address_postal_code, :string, :limit => 13
        column :ship_address_country, :string, :limit => 31
        column :ship_address_note, :string, :limit => 41
        column :ship_address_block_addr1, :string, :limit => 41
        column :ship_address_block_addr2, :string, :limit => 41
        column :ship_address_block_addr3, :string, :limit => 41
        column :ship_address_block_addr4, :string, :limit => 41
        column :ship_address_block_addr5, :string, :limit => 41
        column :print_as, :string, :limit => 41
        column :phone, :string, :limit => 21
        column :mobile, :string, :limit => 21
        column :pager, :string, :limit => 21
        column :alt_phone, :string, :limit => 21
        column :fax, :string, :limit => 21
        column :email, :string, :limit => 1023
        column :contact, :string, :limit => 41
        column :alt_contact, :string, :limit => 41
        column :customer_type_ref_list_id, :string, :limit => 36
        column :customer_type_ref_full_name, :string, :limit => 159
        column :terms_ref_list_id, :string, :limit => 36
        column :terms_ref_full_name, :string, :limit => 31
        column :sales_rep_ref_list_id, :string, :limit => 36
        column :sales_rep_ref_full_name, :string, :limit => 5
        column :balance, :decimal, :precision => 9, :scale => 2
        column :total_balance, :decimal, :precision => 9, :scale => 2
        column :sales_tax_code_ref_list_id, :string, :limit => 36
        column :sales_tax_code_ref_full_name, :string, :limit => 3
        column :item_sales_tax_ref_list_id, :string, :limit => 36
        column :item_sales_tax_ref_full_name, :string, :limit => 31
        column :sales_tax_country, :string, :limit => 31
        column :resale_number, :string, :limit => 21
        column :account_number, :string, :limit => 99
        column :credit_limit, :decimal, :precision => 9, :scale => 2
        column :preferred_payment_method_ref_list_id, :string, :limit => 36
        column :preferred_payment_method_ref_full_name, :string, :limit => 31
        column :credit_card_info_credit_card_number, :string, :limit => 25
        column :credit_card_info_expiration_month, :integer
        column :credit_card_info_expiration_year, :integer
        column :credit_card_info_name_on_card, :string, :limit => 41
        column :credit_card_info_credit_card_address, :string, :limit => 41
        column :credit_card_info_credit_card_postal_code, :string, :limit => 41
        column :job_status, :string
        column :job_start_date, :datetime
        column :job_projected_end_date, :datetime
        column :job_end_date, :datetime
        column :job_desc, :string, :limit => 99
        column :job_type_ref_list_id, :string, :limit => 36
        column :job_type_ref_full_name, :string, :limit => 159
        column :notes, :string, :limit => 4095
        column :is_statement_with_parent, :boolean
        column :delivery_method, :string
        column :price_level_ref_list_id, :string, :limit => 36
        column :price_level_ref_full_name, :string, :limit => 31
      end
    end
  end

end

