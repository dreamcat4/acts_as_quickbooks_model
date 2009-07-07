require 'rubygems'
require 'active_record'
# require 'test/spec'
require 'shoulda'

libxml_bindings_dir = "#{File.expand_path(File.dirname(__FILE__)+'/../../../gems-src/libxml-bindings/lib')}"
$LOAD_PATH.unshift libxml_bindings_dir unless $LOAD_PATH.include?(libxml_bindings_dir)

require File.expand_path(File.dirname(__FILE__) + '/../lib/acts_as_quickbooks_model')
ActiveRecord::Base.send :include, ActsAsQuickbooksModel

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
# ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.establish_connection(config['sqlite3'])

load(File.dirname(__FILE__) + '/schema.rb')
