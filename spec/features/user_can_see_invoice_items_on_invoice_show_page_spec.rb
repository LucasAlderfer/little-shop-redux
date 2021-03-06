RSpec.describe 'a visitor' do
  context 'visiting /invoices/:id' do
    it 'should show all invoice items belonging to invoice' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnotherItem", description: 'Better Item', unit_price: 12346, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_1 = invoice.invoice_items.create(id: 123456, item_id: 12345, quantity: 5, unit_price: 657, created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_2 = invoice.invoice_items.create(id: 123457, item_id: 12346, quantity: 7, unit_price: 650, created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/invoices/1050'

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(invoice_item_1.quantity)
      expect(page).to have_content(invoice_item_2.quantity)
      expect(page).to have_content(item_1.unit_price)
      expect(page).to have_content(item_2.unit_price)
      expect(page).to have_content(item_1.id)
      expect(page).to have_content(item_2.id)
    end
    it 'should show the total price for the invoice' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnotherItem", description: 'Better Item', unit_price: 12346, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_1 = invoice.invoice_items.create(id: 123456, item_id: 12345, quantity: 5, unit_price: 657, created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_2 = invoice.invoice_items.create(id: 123457, item_id: 12346, quantity: 7, unit_price: 650, created_at: '2018-06-27', updated_at: '2018-06-28')
      expected_total = (invoice_item_1.quantity * item_1.unit_price) + (invoice_item_2.quantity * item_2.unit_price)

      visit '/invoices/1050'

      expect(page).to have_content(expected_total)
    end
    it 'should be able to click on item_id to go to item page' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnotherItem", description: 'Better Item', unit_price: 12346, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_1 = invoice.invoice_items.create(id: 123456, item_id: 12345, quantity: 5, unit_price: 657, created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_item_2 = invoice.invoice_items.create(id: 123457, item_id: 12346, quantity: 7, unit_price: 650, created_at: '2018-06-27', updated_at: '2018-06-28')
      expected_total = (invoice_item_1.quantity * item_1.unit_price) + (invoice_item_2.quantity * item_2.unit_price)

      visit '/invoices/1050'

      click_on(item_1.id)

      expect(current_path).to eq("/items/#{item_1.id}")
    end
  end
end
