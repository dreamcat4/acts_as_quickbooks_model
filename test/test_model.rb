# require File.dirname(__FILE__) + '/test_helper'
require 'test_helper'

class Customer < ActiveRecord::Base
  acts_as_quickbooks_model
  has_many :notes
  alias_attribute :is_active, :active
end
class Note < ActiveRecord::Base
  belongs_to :customer
end

class Payment < ActiveRecord::Base
  acts_as_quickbooks_model 'ReceivePayment'
end
class Invoice < ActiveRecord::Base
  acts_as_quickbooks_model
  has_many :invoice_lines
  has_many :invoice_line_groups
end
class InvoiceLine < ActiveRecord::Base
  acts_as_quickbooks_model
  belongs_to :invoice
  belongs_to :invoice_line_group
end
class InvoiceLineGroup < ActiveRecord::Base
  acts_as_quickbooks_model
  belongs_to :invoice
  has_many :lines, :class_name => 'InvoiceLine'
end
class Product < ActiveRecord::Base
  acts_as_quickbooks_model 'ItemInventory', 'ItemNonInventory', 'ItemOtherCharge'
end
class Item < ActiveRecord::Base
  acts_as_quickbooks_model 'ItemSalesTaxGroup'
  has_many :linked_items
  has_many :item_sales_taxs, :class_name => 'LinkedItem'
end
class LinkedItem < ActiveRecord::Base
  acts_as_quickbooks_model 'ItemSalesTax'
  belongs_to :item
end

class TestModel < Test::Unit::TestCase
  
  context 'A model using acts_as_quickbooks_model' do
    setup do
      
      CUSTOMER_RET = <<-XML
<CustomerRet>
        <ListID>123</ListID>
        <Name>Foo</Name>
        <IsActive>true</IsActive>
        <ParentRef>
          <ListID>456</ListID>
        </ParentRef>
        <Notes>foo bar</Notes>
      </CustomerRet>
      XML

      PAYMENT_RET = <<-XML
<ReceivePaymentRet>
        <TxnID>123</TxnID>
      </ReceivePaymentRet>
      XML

      INVOICE_RET = <<-XML
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
      		<InvoiceLineRet>
            <TxnLineID>345</TxnLineID>
            <ItemRef>
              <ListID>789</ListID>
            </ItemRef>
          </InvoiceLineRet>
      	</InvoiceLineGroupRet>
      </InvoiceRet>
      XML

      ITEM_INVENTORY_RET = <<-XML
<ItemInventoryRet>
        <ListID>123</ListID>
        <PurchaseCost>1</PurchaseCost>
      </ItemInventoryRet>
      XML

      ITEM_NON_INVENTORY_RET = <<-XML
<ItemNonInventoryRet>
        <ListID>234</ListID>
        <ManufacturerPartNumber>2</ManufacturerPartNumber>
      </ItemNonInventoryRet>
      XML

      ITEM_OTHER_CHARGE_RET = <<-XML
<ItemOtherChargeRet>
        <ListID>345</ListID>
        <SpecialItemType>foo</SpecialItemType>
      </ItemOtherChargeRet>
      XML

      SALES_TAX_GROUP_RET = <<-XML
<ItemSalesTaxGroupRet>
        <ListID>80000030-1189440679</ListID>
        <TimeCreated>2007-09-10T09:11:19-08:00</TimeCreated>
        <TimeModified>2007-09-10T09:11:19-08:00</TimeModified>
        <EditSequence>1189440679</EditSequence>
        <Name>San Thomas Group</Name>
        <IsActive>true</IsActive>
        <ItemDesc>Sales Tax - San Thomas County</ItemDesc>
        <ItemSalesTaxRef>
          <ListID>8000002A-1189440679</ListID>
          <FullName>County, San Thomas</FullName>
        </ItemSalesTaxRef>
        <ItemSalesTaxRef>
          <ListID>80000029-1189440679</ListID>
          <FullName>Assessment</FullName>
        </ItemSalesTaxRef>
      </ItemSalesTaxGroupRet>
      XML

    end
    
    should 'assign attributes from qbxml if matching attributes exist on model' do
      customer = Customer.new(:qbxml => CUSTOMER_RET, :foo => 'bar')
      assert customer.list_id == '123'
      assert customer.name == 'Foo'
      assert customer.parent_ref_list_id == '456'
      assert customer.foo == 'bar'
    end

    should 'support alias_attributes on model' do
      customer = Customer.new(:qbxml => CUSTOMER_RET)
      assert customer.active?
    end
  
    should 'support overriding default model type' do
      payment = Payment.create!(:qbxml => PAYMENT_RET)
      assert payment.txn_id == '123'
    end

    should 'build has_many associations by has_many class_name' do
      invoice = Invoice.create!(:qbxml => INVOICE_RET)
      assert invoice.txn_id == '123'
    
      # invoice_lines
      assert invoice.invoice_lines.count == 2
      assert invoice.invoice_lines[0].invoice_id == invoice.id
      assert invoice.invoice_lines[0].txn_line_id == '456'
      assert invoice.invoice_lines[0].item_ref_list_id == '789'
      assert invoice.invoice_lines[1].invoice_id == invoice.id
      assert invoice.invoice_lines[1].txn_line_id == '012'
      assert invoice.invoice_lines[1].item_ref_list_id == '567'
    
      # invoice_line_groups
      assert invoice.invoice_line_groups.count == 1
      assert invoice.invoice_line_groups[0].invoice_id == invoice.id
      assert invoice.invoice_line_groups[0].txn_line_id == '321'
      assert invoice.invoice_line_groups[0].item_group_ref_list_id == '987'
    
      # invoice_line_group invoice_lines
      assert invoice.invoice_line_groups[0].lines.count == 1
      assert invoice.invoice_line_groups[0].lines[0].txn_line_id == '345'
      assert invoice.invoice_line_groups[0].lines[0].item_ref_list_id == '789'
    end
  
    should 'build has_many associations by has_many name' do
      tax1 = Item.create! :list_id => '8000002A-1189440679'
      tax2 = Item.create! :list_id => '80000029-1189440679'

      sales_tax_group = Item.create!(:qbxml => SALES_TAX_GROUP_RET)
      assert sales_tax_group.list_id == '80000030-1189440679'
    
      linked_item1 = sales_tax_group.linked_items[0]
      linked_item2 = sales_tax_group.linked_items[1]

      assert linked_item1.list_id == '8000002A-1189440679'
      assert linked_item2.list_id == '80000029-1189440679'
    end

    should 'allow polymorphic support for models that declare support for multiple qb model types' do
      inventory_product = Product.create!(:qbxml => ITEM_INVENTORY_RET)
      assert inventory_product.list_id == '123'
      assert inventory_product.purchase_cost == 1
    
      non_inventory_product = Product.create!(:qbxml => ITEM_NON_INVENTORY_RET)
      assert non_inventory_product.list_id == '234'
      assert non_inventory_product.manufacturer_part_number == '2'
   
      other_charge_product = Product.create!(:qbxml => ITEM_OTHER_CHARGE_RET)
      assert other_charge_product.list_id == '345'
      assert other_charge_product.special_item_type == 'foo'
    end

    should 'not attempt to assign a has_many if an identical node appears as a QB element' do
      # Example: Customer has_many notes
      # CustomerRet sends back <Notes> node
      customer = Customer.create!(:qbxml => CUSTOMER_RET)
      assert customer.notes.empty?
    end
  end
end
