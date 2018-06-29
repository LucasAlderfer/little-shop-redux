require 'csv'
require './app/models/merchant.rb'

Merchant.delete_all

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(id: row[0], name: row[1], created_at: row[2], updated_at: row[3])
end

puts Merchant.count
