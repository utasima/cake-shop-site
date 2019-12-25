class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def total_price
    @price = item.price * number
    @price.sum
  end
end

