RSpec.describe 'a visitor' do
  context 'visiting /invoices' do
    it 'should show a list of all the invoices' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      within('.invoices_table') do
        expect(page).to have_content('1050')
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      click_link('edit')
      expect(current_path).to eq('/invoices/1050/edit')
    end
    it 'should show a delete button that when clicked will delete the invoice' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      click_on('delete')

      within('.invoices_table') do
        expect(page).to_not have_content('1050')
      end
    end
    it 'should redirect to the invoice show page when an invoice id is clicked on' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices'

      click_on('name-invoice-id')

      expect(current_path).to eq('/invoices/1050')
    end
  end
end