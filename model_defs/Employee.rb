# auto-generated from json definitions
module QBXML::Define

  module Employee
    def define_columns
      return Proc.new do
        column :list_id, :string, :limit => 36
        column :time_created, :datetime
        column :time_modified, :datetime
        column :edit_sequence, :string, :limit => 16
        column :name, :string, :limit => 41
        column :is_active, :boolean
        column :salutation, :string, :limit => 15
        column :first_name, :string, :limit => 25
        column :middle_name, :string, :limit => 5
        column :last_name, :string, :limit => 25
        column :suffix, :string
        column :employee_address_addr1, :string, :limit => 41
        column :employee_address_addr2, :string, :limit => 41
        column :employee_address_addr3, :string
        column :employee_address_addr4, :string
        column :employee_address_city, :string, :limit => 31
        column :employee_address_state, :string, :limit => 21
        column :employee_address_postal_code, :string, :limit => 13
        column :employee_address_country, :string
        column :print_as, :string, :limit => 41
        column :phone, :string, :limit => 21
        column :mobile, :string, :limit => 21
        column :pager, :string, :limit => 21
        column :pager_pin, :string, :limit => 10
        column :alt_phone, :string, :limit => 21
        column :fax, :string, :limit => 21
        column :ssn, :string, :limit => 11
        column :email, :string, :limit => 1023
        column :employee_type, :string
        column :gender, :string
        column :hired_date, :datetime
        column :released_date, :datetime
        column :birth_date, :datetime
        column :account_number, :string, :limit => 99
        column :notes, :string, :limit => 4095
        column :billing_rate_ref_list_id, :string, :limit => 36
        column :billing_rate_ref_full_name, :string, :limit => 31
        column :employee_payroll_info_pay_period, :string
        column :employee_payroll_info_class_ref_list_id, :string, :limit => 36
        column :employee_payroll_info_class_ref_full_name, :string, :limit => 159
        column :employee_payroll_info_clear_earnings, :boolean
        column :employee_payroll_info_earnings_payroll_item_wage_ref_list_id, :string, :limit => 36
        column :employee_payroll_info_earnings_payroll_item_wage_ref_full_name, :string, :limit => 31
        column :employee_payroll_info_earnings_rate, :decimal, :precision => 9, :scale => 2
        column :employee_payroll_info_earnings_rate_percent, :decimal, :precision => 9, :scale => 2
        column :employee_payroll_info_is_using_time_data_to_create_paychecks, :boolean
        column :employee_payroll_info_use_time_data_to_create_paychecks, :string
        column :employee_payroll_info_sick_hours_hours_available, :string
        column :employee_payroll_info_sick_hours_accrual_period, :string
        column :employee_payroll_info_sick_hours_hours_accrued, :string
        column :employee_payroll_info_sick_hours_maximum_hours, :string
        column :employee_payroll_info_sick_hours_is_resetting_hours_each_new_year, :boolean
        column :employee_payroll_info_sick_hours_hours_used, :string
        column :employee_payroll_info_sick_hours_accrual_start_date, :datetime
        column :employee_payroll_info_vacation_hours_hours_available, :string
        column :employee_payroll_info_vacation_hours_accrual_period, :string
        column :employee_payroll_info_vacation_hours_hours_accrued, :string
        column :employee_payroll_info_vacation_hours_maximum_hours, :string
        column :employee_payroll_info_vacation_hours_is_resetting_hours_each_new_year, :boolean
        column :employee_payroll_info_vacation_hours_hours_used, :string
        column :employee_payroll_info_vacation_hours_accrual_start_date, :datetime
      end
    end
  end

end

