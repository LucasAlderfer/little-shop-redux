RSpec.describe 'a visitor' do
  context 'visiting /merchants/new' do
    it 'should return to /merchants by clicking on cancel button' do
      visit '/merchants/new'

      click_link('cancel')

      expect(current_path).to eq('/merchants')
    end
    it 'should create a new merchant with name from form by clicking on create merchant button' do
      visit '/merchants/new'

      fill_in('merchant[name]', with: 'Shopin1902')
      
      click_link('create')
      expect(current_path).to eq('/merchants')
      expect(page).to have_content('Shopin1902')
    end
  end
end
