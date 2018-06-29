RSpec.describe 'a visitor' do
  context 'visiting /merchants/:id/edit' do
    it 'should return to /merchants by clicking on cancel button' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/12345678/edit'

      click_link('cancel')

      expect(current_path).to eq('/merchants/12345678')
    end
    it 'should update a merchant name from form by clicking on update merchant button' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/12345678/edit'

      fill_in('merchant[name]', with: 'Shopin1902')

      click_on('update merchant')
      expect(current_path).to eq('/merchants/12345678')
      expect(page).to have_content('Shopin1902')
    end
  end
end