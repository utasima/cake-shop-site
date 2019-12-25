class OrderItem < ApplicationRecord
  has_many :items
  belongs_to :customer
  belongs_to :order

  enum making_status: { impossible: 0, waiting: 1, in_production: 2, finish: 3 }
end
