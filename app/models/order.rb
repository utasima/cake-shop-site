class Order < ApplicationRecord
  belongs_to :customer, -> { with_deleted }
  has_many :order_items
  require "date"
  enum order_status: { unpaid: 0, deposited: 1, in_production: 2, preparing: 3, sent: 4 }

  enum payment: {クレジットカード:0, 銀行振込:1}
  acts_as_paranoid
end