# auto-generated from json definitions
module QBXML::Define

  module TimeTracking
    def define_columns
      return Proc.new do
        column :txn_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :txn_number, :integer
        column :txn_date, :datetime
        column :entity_ref_list_id, :string, :limit => 36
        column :entity_ref_full_name, :string, :limit => 209
        column :customer_ref_list_id, :string, :limit => 36
        column :customer_ref_full_name, :string, :limit => 209
        column :item_service_ref_list_id, :string, :limit => 36
        column :item_service_ref_full_name, :string, :limit => 159
        column :rate, :decimal, :precision => 9, :scale => 2
        column :duration, :string
        column :class_ref_list_id, :string, :limit => 36
        column :class_ref_full_name, :string, :limit => 159
        column :payroll_item_wage_ref_list_id, :string, :limit => 36
        column :payroll_item_wage_ref_full_name, :string, :limit => 31
        column :notes, :string, :limit => 4095
        column :billable_status, :string
        column :is_billable, :boolean
        column :is_billed, :boolean
      end
    end
  end

end

