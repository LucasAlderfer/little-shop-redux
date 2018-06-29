require 'csv'
require './app/models/merchant.rb'
require './app/models/invoice.rb'

Merchant.delete_all

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |row|
  Merchant.create(id: row[0], name: row[1], created_at: row[2], updated_at: row[3])
end

puts Merchant.count

Invoice.delete_all

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |row|
  Invoice.create(id: row[0], customer_id: row[1], merchant_id: row[2], status: row[3], created_at: row[4], updated_at: row[5])
end

puts Invoice.count
