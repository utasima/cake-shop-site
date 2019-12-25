class Admin::OrdersController < ApplicationController
  def index
    @orders = OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
    
  end

  def new
  end

  def confirmation
  end 

  def thanks
  end


  def create
  end

  def update
    @order = Order.find(params[:id])
    if
      @order.update(order_params)
      redirect_to admind_orders_path(@order), notice: '更新しました。'
    else
      render action: :show
    end
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment,:making_status)
  end

end
