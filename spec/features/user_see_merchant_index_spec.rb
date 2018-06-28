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

      save_and_open_page

      click_link('edit')
      expect(current_path).to eq('/merchants/12345678/edit')
    end
  end
end
