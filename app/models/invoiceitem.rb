class InvoiceItem < ActiveRecord::Base

  validates_presence_of :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  belongs_to :item
  belongs_to :invoice

end
