RSpec.describe 'a visitor' do
  context 'visits' do
    it 'should be able to click merchant dashboard and go to merchant dashboard' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/'

      click_link("Merchants Dashboard")

      expect(current_path).to eq('/merchants-dashboard')
    end
    it 'should be able to click item dashboard and see item dashboard' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/'

      click_link("Items Dashboard")

      expect(current_path).to eq('/items-dashboard')
    end
    it 'should be able to click invoice dashboard and see invoice dashboard' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnotherItem", description: 'Better Item', unit_price: 12346, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_1 = invoice.invoice_items.create(id: 123456, item_id: 12345, quantity: 5, unit_price: 657, created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_2 = invoice.invoice_items.create(id: 123457, item_id: 12346, quantity: 7, unit_price: 650, created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/'

      click_link("Invoices Dashboard")

      expect(current_path).to eq('/invoices-dashboard')
    end
  end
end
