class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  
  validates_presence_of :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

end
