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

  def self.status_percentages
    group(:status).count.each_with_object(Hash.new(0)) do |(status, occurances), hash|
      hash[status] = ((occurances * 100) / Invoice.all.count)
    end
  end

  def self.highest_unit_price
    find(InvoiceItem.find_by(unit_price: InvoiceItem.maximum(:unit_price)).invoice_id).id
  end

  def self.lowest_unit_price
    find(InvoiceItem.find_by(unit_price: InvoiceItem.minimum(:unit_price)).invoice_id).id
  end

  def self.highest_quantity
    find(InvoiceItem.find_by(quantity: InvoiceItem.maximum(:quantity)).invoice_id).id
  end

  def self.lowest_quantity
    find(InvoiceItem.find_by(quantity: InvoiceItem.minimum(:quantity)).invoice_id).id
  end
end
