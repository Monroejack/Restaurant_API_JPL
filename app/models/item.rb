class Item < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :menu
  has_many :items_orders
  has_many :orders, through: :items_orders
end
