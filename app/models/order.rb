class Order < ApplicationRecord
  belongs_to :customer

  enum order_status: { unpaid: 0, deposited: 1, in_production: 2, preparing: 3, sent: 4 }
end
