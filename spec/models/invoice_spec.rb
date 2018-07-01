RSpec.describe Invoice do
  describe 'Validations' do
    it 'is valid with all attributes' do
      invoice = Invoice.create(id: 123, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')

      expect(invoice).to be_valid
    end
    it 'is invalid without an id' do
      invoice = Invoice.create(customer_id: 87654321, merchant_id: 12348765, updated_at: '2012-12-10', created_at: '2012-11-10')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a customer_id' do
      invoice = Invoice.create(id: 12345678, merchant_id: 12348765, updated_at: '2012-12-10', created_at: '2012-11-10')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a merchant_id date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: '2012-12-10', created_at: '2012-11-10')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an updated_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, created_at: '2012-11-10')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an created_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: '2012-12-10')

      expect(invoice).to_not be_valid
    end
  end
  describe 'Class Methods' do
    it 'can calculate each invoice status as a percent of total invoices' do
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12345678, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12345678, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_3 = Invoice.create(id: 1052, customer_id: 87654321, merchant_id: 12345678, status: 'returned', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_4 = Invoice.create(id: 1053, customer_id: 87654321, merchant_id: 12345678, status: 'returned', updated_at: '2012-12-10', created_at: '2012-11-10')

      expected = {'pending' => 25, 'shipped' => 25, 'returned' => 50}
      
      expect(Invoice.status_percentages).to eq(expected)
    end
    it 'can find the invoice with the highest associated unit_price' do
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12345678, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12345678, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id
      
      expect(Invoice.highest_unit_price).to eq(expected)
    end
    it 'can find the invoice with the lowest associated unit_price' do
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12345678, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12345678, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id
      
      expect(Invoice.lowest_unit_price).to eq(expected)
    end
    it 'can find the invoice with the highest associated quantity' do
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12345678, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12345678, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id
      
      expect(Invoice.highest_quantity).to eq(expected)
    end
    it 'can find the invoice with the lowest associated quantity' do
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12345678, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12345678, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id
      
      expect(Invoice.lowest_quantity).to eq(expected)
    end
  end
  describe 'Instance Methods' do
    it 'can determine its own total price' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnotherItem", description: 'Better Item', unit_price: 12346, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_1 = invoice.invoice_items.create(id: 123456, item_id: 12345, quantity: 5, unit_price: 657, created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_2 = invoice.invoice_items.create(id: 123457, item_id: 12346, quantity: 7, unit_price: 650, created_at: '2018-06-27', updated_at: '2018-06-28')
      expected_total = (invoice_item_1.quantity * item_1.unit_price) + (invoice_item_2.quantity * item_2.unit_price)
      
      expect(invoice.total_price).to eq(expected_total)
    end
  end
end
