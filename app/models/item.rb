class Item < ActiveRecord::Base

  validates_presence_of :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

end
