require 'pry'

RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a name' do
      item = Item.new(id: 12345, description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without a description' do
      item = Item.new(id: 12345, name: 'AnItem', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without a price' do
      item = Item.new(id: 12345, name: 'AnItem', description: 'Good Item', image_url: 'anything', merchant_id: 12344105, created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without an image' do
      item = Item.new(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, merchant_id: 12344105, created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without an id' do
      item = Item.new(name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without a merchant id' do
      item = Item.new(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', created_at: 2018-06-27, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without a created at' do
      item = Item.new(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, updated_at: 2018-06-29)

      expect(item).to_not be_valid
    end
    it 'is invalid without an updated at' do
      item = Item.new(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, created_at: 2018-06-27)

      expect(item).to_not be_valid
    end
    it 'is valid with all correct information' do
        item = Item.create(id: 1234, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-27', updated_at: '2018-06-28')

        expect(item).to be_valid
    end
  end
  describe 'instance methods' do
    it '.merchant_name' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: '2012-12-10', created_at: '2012-11-10')
      item = Item.create(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: merchant.id, created_at: '2018-06-27', updated_at: '2018-06-29')
      expect(item.merchant_name).to eq('Shopin1901')
    end
  end
  describe 'class methods' do
    it '.generate_id' do
      expect(Item.generate_id).to eq(1)

      item_1 = Item.create(id: Item.generate_id, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: 123, created_at: '2018-06-27', updated_at: '2018-06-29')

      expect(Item.generate_id).to eq(2)
    end
    it 'can count total items' do
      item_1 = Item.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', merchant_id: 12344105, created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = Item.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = Item.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = 3

      expect(Item.total_count).to eq(expected)
    end
    it 'can calculate average price of all items' do
      item_1 = Item.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', merchant_id: 12344105, created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = Item.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = Item.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-30', updated_at: '2018-06-30')

      expect(Item.average_price).to eq(2000)
    end
    it 'can find the most recently created item' do
      item_1 = Item.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', merchant_id: 12344105, created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = Item.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = Item.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = item_3

      expect(Item.newest).to eq(expected)
    end
    it 'can find the oldest item' do
      item_1 = Item.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', merchant_id: 12344105, created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = Item.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = Item.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', merchant_id: 12344105, created_at: '2018-06-30', updated_at: '2018-06-30')

      expected = item_1

      expect(Item.oldest).to eq(expected)
    end
  end
end
