class Merchant < ActiveRecord::Base
  has_many :invoices
  validates_presence_of :id, :name, :created_at, :updated_at

  has_many :items

  def total_items
    items.count
  end

  def average_item_price
    items.average(:unit_price)
  end

  def total_items_price
    items.sum(:unit_price)
  end

  def self.most_items
    all.max_by do |merchant|
      merchant.total_items
    end
  end

  def self.highest_priced_item
    Item.find_by(unit_price: Item.maximum(:unit_price)).merchant
  end
end
