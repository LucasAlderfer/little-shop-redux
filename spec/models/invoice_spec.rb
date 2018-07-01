RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without an id' do
      invoice = Invoice.create(customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a customer_id' do
      invoice = Invoice.create(id: 12345678, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a merchant_id date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an updated_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an created_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10)

      expect(invoice).to_not be_valid
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
