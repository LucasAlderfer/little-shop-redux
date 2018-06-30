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
  end
  describe 'instance methods' do
    it '.merchant_name' do
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: '2012-12-10', created_at: '2012-11-10')
      item = Item.create(id: 12345, name: 'AnItem', description: 'Good Item', unit_price: 12345, image_url: 'anything', merchant_id: merchant.id, created_at: '2018-06-27', updated_at: '2018-06-29')
      expect(item.merchant_name).to eq('Shopin1901')
    end
  end
end
