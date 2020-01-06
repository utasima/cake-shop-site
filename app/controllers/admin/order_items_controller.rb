class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def show
    @order = Order.all
  end

  def create
  end

  def update
    @order_item = OrderItem.find(params[:order_item][:test_id].to_i)
    @order_item.update(making_status: params[:order_item][:making_status])
    redirect_to admin_orders_path(@order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end