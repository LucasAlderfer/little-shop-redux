class Merchant < ActiveRecord::Base
  has_many :invoices
  validates_presence_of :id, :name, :created_at, :updated_at

end
