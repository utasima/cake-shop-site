class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def show
  end

  def new
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end

  def confirmation
  end

  def thanks
  end

  def destroy
  end

  def create
  end

  private 
    def order_params
      params.require(:order).permit(:postage,:total_price,:order_status,:payment,:name,:order_postal_code,:adress,)
    end

end
