RSpec.describe 'a visitor' do
  context 'visiting /items/' do
    it 'can click on the dashboard symbol and render the dashboard page' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items'

      click_on('Dashboard')
      expect(current_path).to eq('/items-dashboard')
    end
  end
  context 'visiting /items-dashboard' do
    it 'can visit /merchants by clicking on Merchants' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'

      click_on('Merchants')
      expect(current_path).to eq('/merchants')
    end
    it 'can visit /items by clicking on Items' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'

      click_on('Items')
      expect(current_path).to eq('/items')
    end
    it 'can visit /invoices by clicking on Invoices' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'

      click_on('Invoices')
      expect(current_path).to eq('/invoices')
    end
    it 'displays the total item count' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'
      Item.create(id: 12347, name: "ThisItem", description: 'Good Item', unit_price: 12345, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'

      within('#item-count') do
        expect(page).to have_content('2')
      end
    end
    it 'displays the average item price' do
      Item.create(id: 12345, name: "AnItem", description: 'Good Item', unit_price: 1000, merchant_id: 12345678, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'
      Item.create(id: 12347, name: "ThisItem", description: 'Good Item', unit_price: 1506, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'

      within('#item-avg-price') do
        expect(page).to have_content('12.53')
      end
    end
    it 'displays the newest item' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Old Item', unit_price: 1000, merchant_id: 12345678, image_url: 'anything', created_at: '2011-06-27', updated_at: '2012-06-28')
      visit '/items-dashboard'
      item_2 = Item.create(id: 12347, name: "ThisItem", description: 'Good Item', unit_price: 1506, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'
      item_3 = Item.create(id: 12341, name: "AnotherItem", description: 'New Item', unit_price: 1506, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')
      visit '/items-dashboard'

      within('#new-item') do
        expect(page).to have_content(item_3.name)
      end
    end
    it 'displays the oldest item' do
      item_1 = Item.create(id: 12345, name: "AnItem", description: 'Old Item', unit_price: 1000, merchant_id: 12345678, image_url: 'anything', created_at: '2011-06-27', updated_at: '2012-06-28')
      visit '/items-dashboard'
      item_2 = Item.create(id: 12347, name: "ThisItem", description: 'Good Item', unit_price: 1506, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-27', updated_at: '2018-06-28')
      visit '/items-dashboard'
      item_3 = Item.create(id: 12341, name: "AnotherItem", description: 'New Item', unit_price: 1506, merchant_id: 12345676, image_url: 'anything', created_at: '2018-06-30', updated_at: '2018-06-30')
      visit '/items-dashboard'

      within('#old-item') do
        expect(page).to have_content(item_1.name)
      end
    end
  end
end
