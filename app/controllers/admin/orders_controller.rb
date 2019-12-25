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
    # @deliver_info = DeliverInfo.new(deliver_info_params)
    # @deliver_info.customer_id = current_customer.id
    # if @deliver_info.save
    #   redirect_to deliver_infos_path(@deliver_infos), notice: '住所を追加しました'
    # else
    #   render action: :index
    # end
  end

  def update
    # if
    #   @deliver_info.update(deliver_info_params)
    #   redirect_to deliver_infos_path(@deliver_infos), notice: '更新しました。'
    # else
    #   render action: :edit
    # end
  end

  def destroy
    # @deliver_info.destroy
    # redirect_to deliver_infos_path
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment,:making_status)
  end

end
