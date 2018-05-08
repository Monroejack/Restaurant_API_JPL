class Menu < ApplicationRecord
  validates :heading, uniqueness: true

  has_many :items
end
