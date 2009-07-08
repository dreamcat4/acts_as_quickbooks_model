# auto-generated from json definitions
require 'storable'
module QBXML
  module ModelMaps
    ReceivePayment = Storable::OrderedHash[
      :txn_id, 'TxnID',
      :time_created, 'TimeCreated',
      :time_modified, 'TimeModified',
      :edit_sequence, 'EditSequence',
      :txn_number, 'TxnNumber',
      :customer_ref_list_id, 'CustomerRef/ListID',
      :customer_ref_full_name, 'CustomerRef/FullName',
      :ar_account_ref_list_id, 'ARAccountRef/ListID',
      :ar_account_ref_full_name, 'ARAccountRef/FullName',
      :txn_date, 'TxnDate',
      :ref_number, 'RefNumber',
      :total_amount, 'TotalAmount',
      :payment_method_ref_list_id, 'PaymentMethodRef/ListID',
      :payment_method_ref_full_name, 'PaymentMethodRef/FullName',
      :memo, 'Memo',
      :deposit_to_account_ref_list_id, 'DepositToAccountRef/ListID',
      :deposit_to_account_ref_full_name, 'DepositToAccountRef/FullName',
      :credit_card_txn_info_credit_card_txn_input_info_credit_card_number, 'CreditCardTxnInfo/CreditCardTxnInputInfo/CreditCardNumber',
      :credit_card_txn_info_credit_card_txn_input_info_expiration_month, 'CreditCardTxnInfo/CreditCardTxnInputInfo/ExpirationMonth',
      :credit_card_txn_info_credit_card_txn_input_info_expiration_year, 'CreditCardTxnInfo/CreditCardTxnInputInfo/ExpirationYear',
      :credit_card_txn_info_credit_card_txn_input_info_name_on_card, 'CreditCardTxnInfo/CreditCardTxnInputInfo/NameOnCard',
      :credit_card_txn_info_credit_card_txn_input_info_credit_card_address, 'CreditCardTxnInfo/CreditCardTxnInputInfo/CreditCardAddress',
      :credit_card_txn_info_credit_card_txn_input_info_credit_card_postal_code, 'CreditCardTxnInfo/CreditCardTxnInputInfo/CreditCardPostalCode',
      :credit_card_txn_info_credit_card_txn_input_info_commercial_card_code, 'CreditCardTxnInfo/CreditCardTxnInputInfo/CommercialCardCode',
      :credit_card_txn_info_credit_card_txn_input_info_transaction_mode, 'CreditCardTxnInfo/CreditCardTxnInputInfo/TransactionMode',
      :credit_card_txn_info_credit_card_txn_input_info_credit_card_txn_type, 'CreditCardTxnInfo/CreditCardTxnInputInfo/CreditCardTxnType',
      :credit_card_txn_info_credit_card_txn_result_info_result_code, 'CreditCardTxnInfo/CreditCardTxnResultInfo/ResultCode',
      :credit_card_txn_info_credit_card_txn_result_info_result_message, 'CreditCardTxnInfo/CreditCardTxnResultInfo/ResultMessage',
      :credit_card_txn_info_credit_card_txn_result_info_credit_card_trans_id, 'CreditCardTxnInfo/CreditCardTxnResultInfo/CreditCardTransID',
      :credit_card_txn_info_credit_card_txn_result_info_merchant_account_number, 'CreditCardTxnInfo/CreditCardTxnResultInfo/MerchantAccountNumber',
      :credit_card_txn_info_credit_card_txn_result_info_authorization_code, 'CreditCardTxnInfo/CreditCardTxnResultInfo/AuthorizationCode',
      :credit_card_txn_info_credit_card_txn_result_info_avs_street, 'CreditCardTxnInfo/CreditCardTxnResultInfo/AVSStreet',
      :credit_card_txn_info_credit_card_txn_result_info_avs_zip, 'CreditCardTxnInfo/CreditCardTxnResultInfo/AVSZip',
      :credit_card_txn_info_credit_card_txn_result_info_card_security_code_match, 'CreditCardTxnInfo/CreditCardTxnResultInfo/CardSecurityCodeMatch',
      :credit_card_txn_info_credit_card_txn_result_info_recon_batch_id, 'CreditCardTxnInfo/CreditCardTxnResultInfo/ReconBatchID',
      :credit_card_txn_info_credit_card_txn_result_info_payment_grouping_code, 'CreditCardTxnInfo/CreditCardTxnResultInfo/PaymentGroupingCode',
      :credit_card_txn_info_credit_card_txn_result_info_payment_status, 'CreditCardTxnInfo/CreditCardTxnResultInfo/PaymentStatus',
      :credit_card_txn_info_credit_card_txn_result_info_txn_authorization_time, 'CreditCardTxnInfo/CreditCardTxnResultInfo/TxnAuthorizationTime',
      :credit_card_txn_info_credit_card_txn_result_info_txn_authorization_stamp, 'CreditCardTxnInfo/CreditCardTxnResultInfo/TxnAuthorizationStamp',
      :credit_card_txn_info_credit_card_txn_result_info_client_trans_id, 'CreditCardTxnInfo/CreditCardTxnResultInfo/ClientTransID',
      :unused_payment, 'UnusedPayment',
      :unused_credits, 'UnusedCredits'
    ]
  end
end
