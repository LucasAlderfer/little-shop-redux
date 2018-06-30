RSpec.describe 'a visitor' do
  context 'visiting /merchants/:id' do
    it 'should show the invoice id' do
      invoice = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      within('section') do
        expect(page).to have_content("Invoice: #{invoice.id} - #{invoice.status.capitalize}")
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      click_link('edit')
      expect(current_path).to eq('/invoices/1050/edit')
    end
    it 'should show a delete button that when clicked will delete the merchant' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      click_on('delete')

      expect(current_path).to eq('/invoices')
      within('.invoices_table') do
        expect(page).to_not have_content('1050')
      end
    end
  end
end