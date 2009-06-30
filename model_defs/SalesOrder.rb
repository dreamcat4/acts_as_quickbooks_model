# auto-generated from json definitions
module QBXML::Define

  module SalesOrder
    def define_columns
      return Proc.new do
        column :txn_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :txn_number, :integer
        column :customer_ref_list_id, :string, :limit => 36
        column :customer_ref_full_name, :string, :limit => 209
        column :class_ref_list_id, :string, :limit => 36
        column :class_ref_full_name, :string, :limit => 159
        column :template_ref_list_id, :string, :limit => 36
        column :template_ref_full_name, :string, :limit => 31
        column :txn_date, :datetime
        column :ref_number, :string, :limit => 11
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
        column :po_number, :string, :limit => 25
        column :terms_ref_list_id, :string, :limit => 36
        column :terms_ref_full_name, :string, :limit => 31
        column :due_date, :datetime
        column :sales_rep_ref_list_id, :string, :limit => 36
        column :sales_rep_ref_full_name, :string, :limit => 5
        column :fob, :string, :limit => 13
        column :ship_date, :datetime
        column :ship_method_ref_list_id, :string, :limit => 36
        column :ship_method_ref_full_name, :string, :limit => 15
        column :subtotal, :decimal, :precision => 9, :scale => 2
        column :item_sales_tax_ref_list_id, :string, :limit => 36
        column :item_sales_tax_ref_full_name, :string, :limit => 31
        column :sales_tax_percentage, :decimal, :precision => 9, :scale => 2
        column :sales_tax_total, :decimal, :precision => 9, :scale => 2
        column :total_amount, :decimal, :precision => 9, :scale => 2
        column :is_manually_closed, :boolean
        column :is_fully_invoiced, :boolean
        column :memo, :string, :limit => 4095
        column :customer_msg_ref_list_id, :string, :limit => 36
        column :customer_msg_ref_full_name, :string, :limit => 101
        column :is_to_be_printed, :boolean
        column :is_to_be_emailed, :boolean
        column :is_tax_included, :boolean
        column :customer_sales_tax_code_ref_list_id, :string, :limit => 36
        column :customer_sales_tax_code_ref_full_name, :string, :limit => 3
        column :other, :string, :limit => 29
      end
    end
  end

end

