RSpec.describe 'a visitor' do
  context 'visiting /invoices/:id/edit' do
    it 'should show the current invoice ID and status in the section' do
      invoice = Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      within('section') do
        expect(page).to have_content("Invoice: #{invoice.id} - #{invoice.status.capitalize}")
      end
    end
    it 'should return to /invoices by clicking on cancel button' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      click_link('cancel')

      expect(current_path).to eq('/invoices')
    end
    it 'should update an invoice status from form by clicking on update invoice button' do
      Invoice.create(id: 1050, customer_id: 87654321, merchant_id: 12348765, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      fill_in('invoice[status]', with: 'Shipped')

      click_on('update invoice')

      expect(current_path).to eq('/invoices/1050')
      expect(page).to have_content("Invoice: #{1050}")
    end
  end
end
