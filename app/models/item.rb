class Item < ApplicationRecord
  validates :name , presence: true, length: {maximum: 30}
  validates :description , length: {maximum: 1000}
  validates :price , presence: true
  attachment :image

  has_many :order_items
  has_many :cart_items
  belongs_to :genre
  acts_as_paranoid
end
