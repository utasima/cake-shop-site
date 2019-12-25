class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def showpa
  end

  def new
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end

  def confirmation
    # @cart = CartItem.where(customer_id: current_customwer)
    @carts = current_customer.cart_items
    @order = Order.new(order_params)
  end

  def thanks
  end

  def destroy
  end

  def create
    @order = Order.new(
      postage: 500
      total_price: params[:total_price]
      order_status: 
      payment: params[:payment]
      name: params[:name]
      order_postal_code: params[:order_postal_code]
      adress: params[:adress]
      customer_id: params[:customer_id]

    )

  end

  private 
    def order_params
      params.require(:order).permit(:postage,:total_price,:order_status,:payment,:name,:order_postal_code,:adress,)
    end

end
