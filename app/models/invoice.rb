class Invoice < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

end
