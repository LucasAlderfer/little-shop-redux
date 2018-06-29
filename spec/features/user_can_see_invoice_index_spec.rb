RSpec.describe 'a visitor' do
  context 'visiting /invoices' do
    it 'should show a list of all the invoices' do
      Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)
      visit '/invoices'

      within('.invoices_table') do
        expect(page).to have_content('12345678')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)
      visit '/invoices'

      click_link('edit')
      expect(current_path).to eq('/invoices/12345678/edit')
    end
    it 'should show a delete button that when clicked will delete the invoice' do
      Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)
      visit '/invoices'

      click_on('delete')

      within('.invoices_table') do
        expect(page).to_not have_content('12345678')
      end
    end
  end
end