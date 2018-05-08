class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders
  accepts_nested_attributes_for :item_orders

  before_save :set_total!

private

  def set_total!
    self.total = items.sum(:price)
  end
end
