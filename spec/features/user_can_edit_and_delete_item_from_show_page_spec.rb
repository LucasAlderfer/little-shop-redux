RSpec.describe 'a visitor' do
  context 'visiting /items/:id' do
    it 'should show the item name' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items/12345'

      within('section') do
        expect(page).to have_content(item_1.name)
      end
    end
    it 'should show item description' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items/12345'

      within('section') do
        expect(page).to have_content(item_1.description)
      end
    end
    it 'should show item unit price' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items/12345'

      within('section') do
        expect(page).to have_content(item_1.unit_price)
      end
    end
    it 'should show item merchant name' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      merchant = item_1.merchant.create(name:'JP')
      visit '/items/12345'

      within('section') do
        expect(page).to have_content(merchant.name)
      end
    end
    it 'should show item image' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: "/Pembroke_Welsh_Corgi_Puppy.jpg", created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345'

      within('section') do
        expect(page).to have_content('anything')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items/12345'

      click_link('edit')

      expect(current_path).to eq('/items/12345/edit')
    end
    it 'should show a delete button that when clicked will delete the merchant' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Good Item', merchant_id: 1, unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items/12345'

      click_on('delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content(item_1.name)
    end
  end
end
