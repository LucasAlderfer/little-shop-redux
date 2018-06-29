RSpec.describe 'a visitor' do
  context 'visiting /merchants/new' do
    it 'should return to /merchants by clicking on cancel button' do
      visit '/merchants/new'

      click_link('cancel')

      expect(current_path).to eq('/merchants')
    end
    it 'should create a new merchant with name from form by clicking on create merchant button' do
      Merchant.create(id: 12345678, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      visit '/merchants/new'

      fill_in('merchant[name]', with: 'Shopin1902')

      click_on('create')
      expect(current_path).to eq('/merchants/12345679')
      expect(page).to have_content('Shopin1902')
    end
  end
end
