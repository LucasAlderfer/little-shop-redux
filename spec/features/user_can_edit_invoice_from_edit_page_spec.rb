RSpec.describe 'a visitor' do
  context 'visiting /invoices/:id/edit' do
    it 'should show the current invoice ID and status in the section' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      within('section') do
        expect(page).to have_content("Invoice: #{invoice.id} - #{invoice.status.capitalize}")
      end
    end
    it 'should return to /invoices by clicking on cancel button' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      click_link('cancel')

      expect(current_path).to eq('/invoices')
    end
    it "should show the invoice's merchant name within a dropdown menu" do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      within('#invoice-merchant-name') do
        expect(page).to have_content(merchant.name)
      end
    end
    it 'should update an invoice status from form by clicking on update invoice button' do
      merchant = Merchant.create(id: 12348765, name:'Shopin1901', created_at: '2017-12-12', updated_at: '2018-02-05')
      invoice = merchant.invoices.create(id: 1050, customer_id: 87654321, status: 'pending', updated_at: '2012-12-10', created_at: '2012-11-10')
      visit '/invoices/1050/edit'

      find('#invoice-status-dropdown').find(:xpath, 'option[3]').select_option


      click_on('update invoice')

      expect(current_path).to eq('/invoices/1050')
      expect(page).to have_content("Invoice: #{invoice.id}")
      expect(page).to have_content("Invoice: #{invoice.id} - Returned")
    end
  end
end
