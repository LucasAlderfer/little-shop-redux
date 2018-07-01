RSpec.describe InvoiceItem do
  describe 'Validations' do
    it 'is valid with all params' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, invoice_id:1, quantity:5, unit_price:13635, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to be_valid
    end
    it 'is invalid without an id' do
      invoice_item = InvoiceItem.create(item_id:263519844, invoice_id:1, quantity:5, unit_price:13635, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without an item_id' do
      invoice_item = InvoiceItem.create(id:1, invoice_id:1, quantity:5, unit_price:13635, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without an invoice_id' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, quantity:5, unit_price:13635, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a quantity' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, invoice_id:1, unit_price:13635, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a unit_price' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, invoice_id:1, quantity:5, created_at:'2012-03-27', updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a created_at' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, invoice_id:1, quantity:5, unit_price:13635, updated_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without an updated_at' do
      invoice_item = InvoiceItem.create(id:1, item_id:263519844, invoice_id:1, quantity:5, unit_price:13635, created_at:'2012-03-27')

      expect(invoice_item).to_not be_valid
    end
  end
end
