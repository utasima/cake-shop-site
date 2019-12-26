class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders.each do |o|
      @order = o
      @customer = o.customer
      o.order_items.each do |oi|
        @order_item = oi
        @item = oi.item
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
      @order.order_items.each do |oi|
        @order_item = oi
        @item = oi.item
      end
  end

  def new
    @order = Order.new
  end

  def confirmation
  end 

  def thanks
  end


  def create
  end

  def update
    @order_item = OrderItem.new
    @order_item = OrderItem.where(order_id: params[:id])
    @order = Order.find(params[:id])
    if
      @order.update(order_params)
      @order_item.update(order_item_params)
      redirect_to admin_orders_path(@order), notice: '更新しました。'
    # elsif
    #   @order_item.update(order_item_params)
    #   redirect_to admin_orders_path(@order), notice: '更新しました。'
    else
      render action: :show
    end
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment,:order_status)
  end

  def order_item_params
    params.require(:order_item).permit(:number,:price,:making_status)
  end
end
