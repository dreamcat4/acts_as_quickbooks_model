# auto-generated from json definitions
module QBXML::Define

  module ReceivePayment
    def define_columns
      return Proc.new do
        column :txn_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :txn_number, :integer
        column :customer_ref_list_id, :string, :limit => 36
        column :customer_ref_full_name, :string, :limit => 209
        column :ar_account_ref_list_id, :string, :limit => 36
        column :ar_account_ref_full_name, :string, :limit => 159
        column :txn_date, :datetime
        column :ref_number, :string, :limit => 20
        column :total_amount, :decimal, :precision => 9, :scale => 2
        column :payment_method_ref_list_id, :string, :limit => 36
        column :payment_method_ref_full_name, :string, :limit => 31
        column :memo, :string, :limit => 4095
        column :deposit_to_account_ref_list_id, :string, :limit => 36
        column :deposit_to_account_ref_full_name, :string, :limit => 159
        column :credit_card_txn_info_credit_card_txn_input_info_credit_card_number, :string, :limit => 25
        column :credit_card_txn_info_credit_card_txn_input_info_expiration_month, :integer
        column :credit_card_txn_info_credit_card_txn_input_info_expiration_year, :integer
        column :credit_card_txn_info_credit_card_txn_input_info_name_on_card, :string, :limit => 41
        column :credit_card_txn_info_credit_card_txn_input_info_credit_card_address, :string, :limit => 41
        column :credit_card_txn_info_credit_card_txn_input_info_credit_card_postal_code, :string, :limit => 18
        column :credit_card_txn_info_credit_card_txn_input_info_commercial_card_code, :string, :limit => 24
        column :credit_card_txn_info_credit_card_txn_input_info_transaction_mode, :string
        column :credit_card_txn_info_credit_card_txn_input_info_credit_card_txn_type, :string
        column :credit_card_txn_info_credit_card_txn_result_info_result_code, :integer
        column :credit_card_txn_info_credit_card_txn_result_info_result_message, :string, :limit => 60
        column :credit_card_txn_info_credit_card_txn_result_info_credit_card_trans_id, :string, :limit => 24
        column :credit_card_txn_info_credit_card_txn_result_info_merchant_account_number, :string, :limit => 32
        column :credit_card_txn_info_credit_card_txn_result_info_authorization_code, :string, :limit => 12
        column :credit_card_txn_info_credit_card_txn_result_info_avs_street, :string
        column :credit_card_txn_info_credit_card_txn_result_info_avs_zip, :string
        column :credit_card_txn_info_credit_card_txn_result_info_card_security_code_match, :string
        column :credit_card_txn_info_credit_card_txn_result_info_recon_batch_id, :string, :limit => 84
        column :credit_card_txn_info_credit_card_txn_result_info_payment_grouping_code, :integer
        column :credit_card_txn_info_credit_card_txn_result_info_payment_status, :string
        column :credit_card_txn_info_credit_card_txn_result_info_txn_authorization_time, :datetime
        column :credit_card_txn_info_credit_card_txn_result_info_txn_authorization_stamp, :integer
        column :credit_card_txn_info_credit_card_txn_result_info_client_trans_id, :string, :limit => 16
        column :unused_payment, :decimal, :precision => 9, :scale => 2
        column :unused_credits, :decimal, :precision => 9, :scale => 2
      end
    end
  end

end

