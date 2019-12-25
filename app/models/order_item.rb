class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  belongs_to :order

  enum making_status: { impossible: 0, waiting: 1, in_production: 2, finish: 3 }
end
