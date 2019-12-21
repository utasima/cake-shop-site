class OrdersController < ApplicationController
  def index
    
  end

  def show
  end

  def new
    @order = Order.new
    @order.save
  end

  def confirmation
  end

  def thanks
  end

  def destroy
  end

  def create
  end

  # private
  # def order_params
  #   params.require(:order).permit(:name)
  # end

end
