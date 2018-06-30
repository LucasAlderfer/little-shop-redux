require 'csv'
require './app/models/merchant.rb'
require './app/models/item.rb'

Merchant.delete_all
Item.delete_all

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(id: row[0], name: row[1], created_at: row[2], updated_at: row[3])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |row|
  Item.create(id: row[0], name: row[1], description: row[2], unit_price: row[3], merchant_id: row[4], created_at: row[5], updated_at: row[6], image_url: "/Pembroke_Welsh_Corgi_Puppy.jpg" )
end

puts Merchant.count
puts Item.count
