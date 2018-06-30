RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without an id' do
      invoice = Invoice.create(customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a customer_id' do
      invoice = Invoice.create(id: 12345678, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a merchant_id date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an updated_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, created_at: 2012-11-10)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without an created_at date' do
      invoice = Invoice.create(id: 12345678, customer_id: 87654321, merchant_id: 12348765, updated_at: 2012-12-10)

      expect(invoice).to_not be_valid
    end
  end
end
