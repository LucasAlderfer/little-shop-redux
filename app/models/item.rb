class Item < ActiveRecord::Base

  validates_presence_of :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :image_url

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def merchant_name
    merchant.name
  end

  def self.generate_id
    if Item.all.empty?
      1
    else
      Item.last.id + 1
    end
  end

  def self.total_count
    count
  end

  def self.average_price
    average(:unit_price)
  end

  def self.newest
    where(created_at: Item.maximum(:created_at)).first
  end

  def self.oldest
    where(created_at: Item.minimum(:created_at)).first
  end
end
