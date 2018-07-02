RSpec.describe 'a visitor' do
  context 'visits' do
    it 'should be able to click merchant index and go to merchant index' do

      visit '/'

      click_link("Merchant Index")

      expect(current_path).to eq('/merchants')
    end
    it 'should be able to click item index and go to item index' do

      visit '/'

      click_link("Item Index")

      expect(current_path).to eq('/items')
    end
    it 'should be able to click invoice index and go to invoice index' do

      visit '/'

      click_link("Invoice Index")

      expect(current_path).to eq('/invoices')
    end
  end
end
