RSpec.describe 'a visitor' do
  context 'visiting /merchants/:id' do
    it 'should show the merchant name' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/12345678'

      within('section') do
        expect(page).to have_content('Shopin1901')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/12345678'

      click_link('edit')
      expect(current_path).to eq('/merchants/12345678/edit')
    end
    it 'should show a delete button that when clicked will delete the merchant' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/12345678'

      click_on('delete')

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content('Shopin1901')
    end
  end
end
