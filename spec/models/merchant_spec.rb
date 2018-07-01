RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create(id: 123, updated_at: "2012-12-10", created_at: "2012-11-10")

      expect(merchant).to_not be_valid
    end
    it 'is invalid without an id' do
      merchant = Merchant.create(name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")

      expect(merchant).to_not be_valid
    end
    it 'is invalid without a created_at date' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10")

      expect(merchant).to_not be_valid
    end
    it 'is invalid without an updated_at date' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", created_at: "2012-11-10")

      expect(merchant).to_not be_valid
    end
    it 'is valid with all params' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")

      expect(merchant).to be_valid
    end
  end
end
