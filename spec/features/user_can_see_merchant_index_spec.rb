RSpec.describe 'a visitor' do
  context 'visiting /merchants' do
    it 'should show a list of all the merchants' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants'

      within('.merchants_table') do
        expect(page).to have_content('Shopin1901')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants'

      click_link('edit')
      expect(current_path).to eq('/merchants/12345678/edit')
    end
    it 'should show a delete button that when clicked will delete the merchant' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants'

      click_on('delete')

      within('.merchants_table') do
        expect(page).to_not have_content('Shopin1901')
      end
    end
    it 'should show a create merchant button that when clicked redirects to create new merchant page' do
      visit '/merchants'

      click_link('Create New Merchant')

      expect(current_path).to eq('/merchants/new')
    end
  end
end
