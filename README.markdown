### Introduction ###

This plugin simplifies the parsing of qbXML messages into ActiveRecord model attributes.

### Usage ###

Declare a non-persistent model (doesn't require migration, won't be saved to db). A non-persistent model can be used for converting data in and out-of qbxml format, when you already have your own models.

	class Customer < ActiveRecord::BaseWithoutTable
	  acts_as_quickbooks_model
	end

Or declare a regular ActiveRecord model that will save your qbxml objects to the database. You must then run the appropriate db migration from `acts_as_quickbooks_model/migrations`.

    class Customer < ActiveRecord::Base
      acts_as_quickbooks_model
    end

From qbxml to ActiveRecord:

    xml = <<-XML
    <CustomerRet>
      <ListID>150000-933272658</ListID>
      <Name>Abercrombie, Kristy</Name>
      <BillAddress>
        <Addr1>Kristy Abercrombie</Addr1>
        <Addr2>5647 Cypress Hill Rd</Addr2>
        <City>Bayshore</City>
        <State>CA</State>
        <PostalCode>94326</PostalCode>
      </BillAddress>
    </CustomerRet>
    XML
    
    customer = Customer.new(:qbxml => xml)
    customer.list_id # => "150000-933272658"
    customer.name # => "Abercrombie, Kristy"
    customer.bill_address_city # => "Bayshore"
    ...

Let's update their address:

	customer.bill_address_addr1 = "4544 Hillard Way"
	customer.bill_address_addr2 = ""
	customer.bill_address_city = "Grand Island"
	customer.bill_address_state = "NE"
	customer.bill_address_postal_code = "68801"	
	customer.valid? # => true

Convert back from ActiveRecord to qbxml:

	customer.to_qbxml # => 
	"<Customer>
	  <ListId>150000-933272658</ListId>
	  <Name>Abercrombie, Kristy</Name>
	  <BillAddress><Addr1>4544 Hillard Way</Addr1></BillAddress>
	  <BillAddress><City>Grand Island</City></BillAddress>
	  <BillAddress><State>NE</State></BillAddress>
	  <BillAddress><PostalCode>68801</PostalCode></BillAddress>
	</Customer>"
    
### Auto-builds has_many associations ###

    class Invoice < ActiveRecord::Base
      acts_as_quickbooks_model
      has_many :invoice_lines
      has_many :invoice_line_groups
    end
    class InvoiceLine < ActiveRecord::Base
      acts_as_quickbooks_model
      belongs_to :invoice
    end
    class InvoiceLineGroup < ActiveRecord::Base
      acts_as_quickbooks_model
      belongs_to :invoice
    end

    xml = <<-XML
    <InvoiceRet>
      <TxnID>123</TxnID>
      <InvoiceLineRet>
        <TxnLineID>456</TxnLineID>
        <ItemRef>
          <ListID>789</ListID>
        </ItemRef>
      </InvoiceLineRet>
      <InvoiceLineRet>
        <TxnLineID>012</TxnLineID>
        <ItemRef>
          <ListID>567</ListID>
        </ItemRef>
      </InvoiceLineRet>
      <InvoiceLineGroupRet>
        <TxnLineID>321</TxnLineID>
        <ItemGroupRef>
          <ListID>987</ListID>
        </ItemGroupRef>
      </InvoiceLineGroupRet>
    </InvoiceRet>
    XML

    invoice = Invoice.create(:qbxml => xml)
    invoice.txn_id # => "123"
    invoice.invoice_lines.count # => 2
    invoice.invoice_line_groups.count # => 1
    invoice.invoice_lines.first.txn_line_id # => "456"
    invoice.invoice_line_groups.first.txn_line_id # => "321"
    ...

### References ###

[QuickBooks SDK Reference](http://developer.intuit.com/qbsdk-current/Common/newOSR/index.html)