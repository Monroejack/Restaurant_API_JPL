class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :user_id
  has_many :items
end
