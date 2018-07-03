class Merchant < ActiveRecord::Base
  has_many :invoices
  validates_presence_of :id, :name, :created_at, :updated_at

  has_many :items

  # def total_items
  #   items.count
  # end
  #
  # def average_item_price
  #   items.average(:unit_price)
  # end
  #
  # def total_items_price
  #   items.sum(:unit_price)
  # end

  def self.most_items
    select("merchants.*, count(merchant_id) AS item_count")
      .joins(:items)
      .group(:merchant_id, :id)
      .order("item_count desc")
      .first
  end

  def self.highest_priced_item
    Item.order("unit_price desc").first.merchant
  end

  def self.dashboard_information
    select("merchants.*, count(merchant_id) AS item_count, avg(unit_price) AS average_unit_price, sum(unit_price) AS total_items_price")
      .joins(:items)
      .group(:merchant_id, :id)
  end
end
