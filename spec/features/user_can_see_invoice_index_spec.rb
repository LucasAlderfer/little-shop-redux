RSpec.describe 'a visitor' do
  context 'visiting /invoices' do
    it 'should show a list of all the invoices' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      save_and_open_page

      within('.invoices_table') do
        expect(page).to have_content('1050')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      click_link('edit')
      expect(current_path).to eq('/invoices/1050/edit')
    end
    it 'should show a delete button that when clicked will delete the invoice' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      click_on('delete')

      within('.invoices_table') do
        expect(page).to_not have_content('1050')
      end
    end
  end
end