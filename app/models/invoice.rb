class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates_presence_of :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def total_price
    
    invoice_items.inject(0) do |sum, invoice_item|
      sum += (invoice_item.quantity * invoice_item.item.unit_price)
    end
  end
end
