RSpec.describe 'a visitor' do
  context 'visiting /merchants-dashboard' do
    it 'should see merchant with most items' do
      merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

      expected = merchant_1

      visit '/merchants-dashboard'

      within ('#merchant-most-items') do
        expect(page).to have_content ("#{merchant_1.name}")
      end
    end
    it 'should see merchant with highest price item' do
      merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

      expected = merchant_2

      visit '/merchants-dashboard'

      within '#merchant-highest-price' do
        expect(page).to have_content("#{merchant_2.name}")
      end
    end
    it 'should see a profile of each merchant' do
      merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

      expected_1 = merchant_1.total_items
      expected_2 = Money.new(merchant_1.average_item_price)
      expected_3 = Money.new(merchant_1.total_items_price)

      visit '/merchants-dashboard'

      expect(page).to have_content("#{merchant_1.name}")
      expect(page).to have_content("Item count: #{expected_1}")
      expect(page).to have_content("Average item price: #{expected_2}")
      expect(page).to have_content("Total cost of items: #{expected_3}")
    end
    it 'should link to merchant with most items' do
      merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

      visit '/merchants-dashboard'

      within ('#merchant-most-items') do
        click_link(merchant_1.name)
      end

      expect(current_path).to eq('/merchants/123')
    end
    it 'should link to merchant with highest price item' do
      merchant_1 = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1a = merchant_1.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2a = merchant_1.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3a = merchant_1.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      visit '/merchants-dashboard'

      within ('#merchant-highest-price') do
        click_link(merchant_2.name)
      end

      expect(current_path).to eq('/merchants/125')
    end
  end
end
