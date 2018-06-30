RSpec.describe 'a visitor' do
  context 'visiting /items/:id/edit' do
    it 'should return to /items/:id by clicking on cancel button' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      click_link('cancel')

      expect(current_path).to eq('/items/12345')
    end
    it 'should update item name from form by clicking on update' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      fill_in('item[name]', with: 'Bad Item')

      click_on('update item')
      expect(current_path).to eq('/items/12345')
      expect(page).to have_content('Bad Item')
    end
    it 'should update item description form by clicking on update' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      fill_in('item[description]', with: 'iuasduhiuhad')

      click_on('update item')
      expect(current_path).to eq('/items/12345')
      expect(page).to have_content('iuasduhiuhad')
    end
    it 'should update item unit_price form by clicking on update' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      fill_in('item[unit_price]', with: '897234')

      click_on('update item')
      expect(current_path).to eq('/items/12345')
      expect(page).to have_content('897234')
    end
    it 'should update item image_url form by clicking on update' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      fill_in('item[image_url]', with: 'ijas')

      click_on('update item')
      expect(current_path).to eq('/items/12345')
      expect(Item.first.image_url).to eq('ijas')
    end
    it 'should select a new merchant and update merchant id from drop down' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      merchant_2 = Merchant.create(name: "Lucas", id: 12, updated_at: "1234-12-12", created_at: "1333-12-12")
      merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')

      visit '/items/12345/edit'

      find('#merchant-name-dropdown').find(:xpath, 'option[2]').select_option

      click_on('update item')

      expect(Item.first.merchant_id).to eq(12)
    end
  end
end
