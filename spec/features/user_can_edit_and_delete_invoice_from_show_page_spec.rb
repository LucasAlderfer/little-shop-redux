RSpec.describe 'a visitor' do
  context 'visiting /invoices/:id' do
    it 'should show the invoice id' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      within('section') do
        expect(page).to have_content("Invoice: #{invoice.id} - #{invoice.status.capitalize}")
      end
    end
    it 'should show an edit button that when clicked will redirect to /edit' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      click_link('edit')
      expect(current_path).to eq('/invoices/1050/edit')
    end
    it 'should show a delete button that when clicked will delete the merchant' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      click_on('delete')

      expect(current_path).to eq('/invoices')
      within('.invoices_table') do
        expect(page).to_not have_content('1050')
      end
    end
    it 'should show a clickable link with the name of the invoices merchant that brings you to the merchant page when clicked' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050'

      within('main') do
        expect(page).to have_content('Shopin1901')
      end

      click_on('name-merchant-link')

      expect(current_path).to eq('/merchants/12348765')
    end
  end
end