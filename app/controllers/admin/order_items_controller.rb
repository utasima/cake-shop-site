class Admin::OrderItemsController < ApplicationController
  def index
  end

  def show
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
    @order_item = OrderItem.find(params[:order_item][:test_id].to_i)
    if @order_item.update(making_status: params[:order_item][:making_status]
      redirect_to admin_orders_path(@order), notice: '更新しました。'
    else
      render action: :show
    end
  end

  def destroy
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
