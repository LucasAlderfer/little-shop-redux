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
  describe 'Instance Methods' do
    it 'can calculate total number of items for this merchant' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1 = merchant.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = merchant.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = merchant.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = merchant.items.count

      expect(merchant.total_items).to eq(expected)
    end
    it 'can calculate average price for all items from this merchant' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1 = merchant.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = merchant.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = merchant.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = 2000

      expect(merchant.average_item_price).to eq(expected)
    end
    it 'can calculate total price for all items from this merchant' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1 = merchant.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = merchant.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = merchant.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = 6000

      expect(merchant.total_items_price).to eq(expected)
    end
    describe 'Class Methods' do
      it 'can calculate the merchant with the most items and output its name' do
        merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
        item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
        item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
        item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

        merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
        item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

        expected = merchant_1

        expect(Merchant.most_items).to eq(expected)
      end
      it 'can calculate the merchant with highest price item and output its name' do
        merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
        item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
        item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
        item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

        merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
        item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

        expected = merchant_2

        expect(Merchant.highest_priced_item).to eq(expected)
      end
    end
  end
end
