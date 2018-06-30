class Item < ActiveRecord::Base

  validates_presence_of :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :image_url

  belongs_to :merchant

  def merchant_name
    merchant.name
  end
end
