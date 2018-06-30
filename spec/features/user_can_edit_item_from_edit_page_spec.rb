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

      save_and_open_page

      fill_in('item[name]', with: 'Bad Item')

      click_on('update item')
      expect(current_path).to eq('/items/12345')
      expect(page).to have_content('Bad Item')
    end
  end
end
