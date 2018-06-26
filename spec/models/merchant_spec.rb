require 'pry'

RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.new(id: 123, updated_at: 2012-12-10, created_at: 2012-11-10)

      expect(merchant).to_not be_valid
    end
    it 'is invalid without an id' do
      merchant = Merchant.new(name: "Shopin1901", updated_at: 2012-12-10, created_at: 2012-11-10)
    end
    it 'is invalid without a created_at date' do
      merchant = Merchant.new(id: 123, name: "Shopin1901", updated_at: 2012-12-10)
    end
    it 'is invalid without an updated_at date' do
      merchant = Merchant.new(id: 123, name: "Shopin1901", created_at: 2012-11-10)
    end
  end
end
# 12334105,Shopin1901,2010-12-10,2011-12-04
