RSpec.describe 'a visitor' do
  context 'visiting/new' do
    it 'should return to /items by clicking on cancel button' do
      visit '/items/new'

      click_link('cancel')

      expect(current_path).to eq('/items')
    end
    it 'should create an item by clicking on create' do
      Merchant.create(name: "JP", id: 1234, updated_at: "1234-12-12", created_at: "1333-12-12")

      visit '/items/new'

      find('#merchant-name-dropdown').find(:xpath,'option[1]').select_option
      fill_in('item[name]', with: 'AnItem')
      fill_in('item[description]', with: 'Good Item')
      fill_in('item[unit_price]', with: '123')
      fill_in('item[image_url]', with: 'uia')

      click_on('create')

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('AnItem')
      expect(page).to have_content('1.23')
      expect(page).to have_content('Good Item')
    end
  end
end
