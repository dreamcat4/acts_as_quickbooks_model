# auto-generated from json definitions
module QBXML::Define

  module Vendor
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 41
        column :is_active, :boolean
        column :is_tax_agency, :boolean
        column :company_name, :string, :limit => 41
        column :salutation, :string, :limit => 15
        column :first_name, :string, :limit => 25
        column :middle_name, :string, :limit => 5
        column :last_name, :string, :limit => 25
        column :suffix, :string
        column :vendor_address_addr1, :string, :limit => 41
        column :vendor_address_addr2, :string, :limit => 41
        column :vendor_address_addr3, :string, :limit => 41
        column :vendor_address_addr4, :string, :limit => 41
        column :vendor_address_addr5, :string, :limit => 41
        column :vendor_address_city, :string, :limit => 31
        column :vendor_address_state, :string, :limit => 21
        column :vendor_address_postal_code, :string, :limit => 13
        column :vendor_address_country, :string, :limit => 31
        column :vendor_address_note, :string, :limit => 41
        column :vendor_address_block_addr1, :string, :limit => 41
        column :vendor_address_block_addr2, :string, :limit => 41
        column :vendor_address_block_addr3, :string, :limit => 41
        column :vendor_address_block_addr4, :string, :limit => 41
        column :vendor_address_block_addr5, :string, :limit => 41
        column :phone, :string, :limit => 21
        column :mobile, :string, :limit => 21
        column :pager, :string, :limit => 21
        column :alt_phone, :string, :limit => 21
        column :fax, :string, :limit => 21
        column :email, :string, :limit => 1023
        column :contact, :string, :limit => 41
        column :alt_contact, :string, :limit => 41
        column :name_on_check, :string, :limit => 41
        column :account_number, :string, :limit => 99
        column :notes, :string, :limit => 4095
        column :vendor_type_ref_list_id, :string, :limit => 36
        column :vendor_type_ref_full_name, :string, :limit => 159
        column :terms_ref_list_id, :string, :limit => 36
        column :terms_ref_full_name, :string, :limit => 31
        column :credit_limit, :decimal, :precision => 9, :scale => 2
        column :vendor_tax_ident, :string, :limit => 15
        column :is_vendor_eligible_for1099, :boolean
        column :balance, :decimal, :precision => 9, :scale => 2
        column :billing_rate_ref_list_id, :string, :limit => 36
        column :billing_rate_ref_full_name, :string, :limit => 31
      end
    end
  end

end

