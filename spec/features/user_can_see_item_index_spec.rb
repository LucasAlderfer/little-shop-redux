RSpec.describe 'a visitor' do
  context 'visiting /items' do
    it 'should show a list of all the items that when clicked redirects to item/show' do
      merchant_1 = Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")
      item_1 = merchant_1.items.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items'

      click_link('AnItem')

      expect(current_path).to eq('/items/12345')
    end
    it 'should show a create a new item button that when clicked redirects to create new item page' do
      visit '/items'

      click_link('Create A New Item')

      expect(current_path).to eq('/items/new')
    end
  end
end
