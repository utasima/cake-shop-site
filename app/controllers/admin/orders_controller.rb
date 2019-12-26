class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all


    @orders.each do |o|
      @order = o


      o.order_items.each do |oi|


        @order_item = oi



        i.item.each do |i|

          @item


        end

      end




    end
  end

  def show
    @order = Order.find(params[:id])
    
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
