class Item < ApplicationRecord
  validates :name , presence: true, length: {minimum: 5, maximum: 30}
  validates :description , length: {maximum: 1000}
  validates :price , presence: true
  attachment :image
end
