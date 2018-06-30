RSpec.describe 'a visitor' do
  context 'visiting /items/:id' do
    it 'should show the item name' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      expect(page).to have_content(item_1.name)
    end
    it 'should show item description' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      expect(page).to have_content(item_1.description)
    end
    it 'should show item unit price' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      expect(page).to have_content(item_1.unit_price)
    end
    it 'should show item merchant name' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      expect(page).to have_content(merchant_1.name)
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      click_link('edit')

      expect(current_path).to eq('/items/12345/edit')
    end
    it 'should show a delete button that when clicked will delete the item' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      click_on('delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content(item_1.name)
    end
  end
end
