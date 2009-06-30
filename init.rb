require "active_record_base_without_table.rb"
ActiveRecord::Base.send :include, ActsAsQuickbooksModel
