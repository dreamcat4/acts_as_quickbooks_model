# auto-generated from json definitions
module QBXML::Define

  module ItemReceipt
    def define_columns
      return Proc.new do
        column :txn_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :txn_number, :integer
        column :vendor_ref_list_id, :string, :limit => 36
        column :vendor_ref_full_name, :string, :limit => 41
        column :ap_account_ref_list_id, :string, :limit => 36
        column :ap_account_ref_full_name, :string, :limit => 159
        column :txn_date, :datetime
        column :total_amount, :decimal, :precision => 9, :scale => 2
        column :ref_number, :string, :limit => 20
        column :memo, :string, :limit => 4095
      end
    end
  end

end

