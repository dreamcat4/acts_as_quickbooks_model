# auto-generated from json definitions
module QBXML::Define

  module ItemPayment
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 31
        column :is_active, :boolean
        column :item_desc, :string, :limit => 4095
        column :deposit_to_account_ref_list_id, :string, :limit => 36
        column :deposit_to_account_ref_full_name, :string, :limit => 159
        column :payment_method_ref_list_id, :string, :limit => 36
        column :payment_method_ref_full_name, :string, :limit => 31
      end
    end
  end

end

