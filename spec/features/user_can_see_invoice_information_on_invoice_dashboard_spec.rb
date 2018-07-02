RSpec.describe 'a visitor' do
  context 'visiting /invoices-dashboard' do
    it 'should show the percentage of all invoices for each status' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_3 = Invoice.create(id: 1052, customer_id: 87654321, merchant_id: 12334105, status: 'returned', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_4 = Invoice.create(id: 1053, customer_id: 87654321, merchant_id: 12334105, status: 'returned', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      visit '/invoices-dashboard'

      expected_pending = 25
      expected_shipped = 25
      expected_returned = 50

      expect(page).to have_content("Pending: #{expected_pending}")
      expect(page).to have_content("Shipped: #{expected_shipped}")
      expect(page).to have_content("Returned: #{expected_returned}")
    end
    it 'should show the highest invoice unit price' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id

      visit '/invoices-dashboard'

      expect(page).to have_content("#{expected}")
    end
    it 'should show the lowest invoice unit price' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id

      visit '/invoices-dashboard'

      expect(page).to have_content("#{expected}")
    end
    it 'should show the highest invoice quantity' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id

      visit '/invoices-dashboard'

      expect(page).to have_content("#{expected}")
    end
    it 'should show the lowest invoice quantity' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:263519844, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:263519847, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:263519841, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:263519849, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id

      visit '/invoices-dashboard'

      expect(page).to have_content("#{expected}")
    end
    it 'should redirect to the highest unit price invoice when id clicked on' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:12345, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:12346, quantity:20, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:12345, quantity:6, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:12346, quantity:7, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id

      visit '/invoices-dashboard'

      click_on("#{expected}")

      expect(current_path).to eq('/invoices/1051')
    end
    it 'should redirect to the lowest unit price invoice when id clicked on' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:12345, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:12346, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:12345, quantity:8, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:12346, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id

      visit '/invoices-dashboard'

      click_on("#{expected}")

      expect(current_path).to eq('/invoices/1050')
    end
    it 'should redirect to the highest invoice quantity invoice when id clicked on' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:12345, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:12346, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:12345, quantity:4, unit_price:10, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:12346, quantity:1, unit_price:9999999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_1.id

      visit '/invoices-dashboard'

      click_on("#{expected}")

      expect(current_path).to eq('/invoices/1050')
    end
    it 'should redirect to the lowest invoice quantity invoice when id clicked on' do
      merchant = Merchant.create(id: 12334105, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice_1 = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12334105, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_1a = invoice_1.invoice_items.create(id:1, item_id:12345, quantity:5, unit_price:135, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_1b = invoice_1.invoice_items.create(id:2, item_id:12346, quantity:7, unit_price:83639, created_at: '2012-03-27', updated_at:'2012-03-27')
      item_1 = merchant.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_2 = merchant.items.create(id: 12346, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: '/Pembroke_Welsh_Corgi_Puppy.jpg', created_at: '2018-06-27', updated_at: '2018-06-28')
      invoice_2 = Invoice.create(id: 1051, customer_id: 87654321, merchant_id: 12334105, status: 'shipped', updated_at: '2012-12-10', created_at: '2012-11-10')
      invoice_item_2a = invoice_2.invoice_items.create(id:3, item_id:12345, quantity:4, unit_price:3453, created_at: '2012-03-27', updated_at:'2012-03-27')
      invoice_item_2b = invoice_2.invoice_items.create(id:4, item_id:12346, quantity:1, unit_price:9999, created_at: '2012-03-27', updated_at:'2012-03-27')

      expected = invoice_2.id

      visit '/invoices-dashboard'

      click_on("#{expected}")

      expect(current_path).to eq('/invoices/1051')
    end
  end
end
