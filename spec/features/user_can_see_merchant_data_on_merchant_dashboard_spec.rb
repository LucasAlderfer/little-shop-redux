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
      merchant = Merchant.create(id: 123, name: "Shopin1901", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_1 = merchant.items.create(id: 1235, name: 'AnItem', description: 'Good Item', unit_price: 1000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')
      item_2 = merchant.items.create(id: 1236, name: 'AnotherItem', description: 'Good Item', unit_price: 2000, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      item_3 = merchant.items.create(id: 1237, name: 'OtherItem', description: 'Good Item', unit_price: 3000, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')

      merchant_2 = Merchant.create(id: 125, name: "Shopin1905", updated_at: "2012-12-10", created_at: "2012-11-10")
      item_2a = merchant_2.items.create(id: 1239, name: 'AnItem', description: 'Good Item', unit_price: 9000, image_url: 'anything', created_at: '2001-06-27', updated_at: '2002-06-28')

      expected = Merchant.dashboard_information
      expected_total_items = merchant.items.count
      expected_average_unit_price = (item_1.unit_price + item_2.unit_price + item_3.unit_price)/merchant.items.count
      expected_total_items_price = merchant.items.sum(:unit_price)

      visit '/merchants-dashboard'

      save_and_open_page

      expect(page).to have_content("#{merchant.name}")
      expect(page).to have_content("Item count: #{expected_total_items}")
      expect(page).to have_content("Average item price: #{expected_average_unit_price}")
      expect(page).to have_content("Total cost of items: 60.00")
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
