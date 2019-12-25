class OrdersController < ApplicationController
  def index
    
  end

  def show
  end

  def new
    @order = Order.new
    @deliver = DeliverInfo.where(customer_id: current_customer)
    @user = Customer.find_by(id: current_customer)
  end

  def confirmation
  end 

  def thanks
  end

  def destroy
  end

  def create
    @order = Order.new
    if params[:address] == "登録先住所"
      @select_address = DeliverInfo.find(params[:registered_address])
      @order.name = @select_address.name
      @order.order_postal_code = @select_address.postal_code
      @order.address = @select_address.address
    elsif params[:address]  == "ご自身の住所"
      @order.name = params[:customers_name]
      @order.order_postal_code = params[:customers_postal_code]
      @order.address = params[:customers_address]
    else
      @order.name = params[:new_name]
      @order.order_postal_code = params[:new_postal_code]
      @order.address = params[:new_address]
    end
    binding.pry
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment)
  end

end
