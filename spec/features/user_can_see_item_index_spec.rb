RSpec.describe 'a visitor' do
  context 'visiting /items' do
    it 'should show a list of all the items that when clicked redirects to item/show' do
      Item.create(id: 12345, title: "AnItem", description: 'Good Item', price: 12345, image: 'anything')
      visit '/items'

      within('.items_table') do
        expect(page).to have_content('AnItem')
      end

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
