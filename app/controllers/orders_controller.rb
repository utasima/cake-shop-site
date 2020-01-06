class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer)

  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @deliver = DeliverInfo.where(customer_id: current_customer)
    @user = Customer.find_by(id: current_customer)
  end

  def confirmation
    @carts = CartItem.where(customer_id: current_customer)

  end

  def  thanks
  end

  def destroy
  end

  def create
    @order = Order.new
    unless session[:order]
      @order.payment = params[:payment]
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
      session[:order] = @order
      redirect_to orders_confirmation_path
    else
        @order = Order.new(
        postage: 800,
        total_price: params[:total_price],
        order_status: 0,
        customer_id: params[:customer_id]
        )
        @order.payment = session[:order]["payment"]
        @order.name = session[:order]["name"]
        @order.order_postal_code = session[:order]["order_postal_code"]
        @order.address  = session[:order]["address"]
        @order.save
        session.delete(:order)
        #order_itemを作成
        @cart = CartItem.where(customer_id: current_customer)
        @cart.each do |cart|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart.item_id
        @order_item.customer_id = current_customer.id
        @order_item.number = cart.number
        @order_item.price = cart.item.price
        @order_item.save
        end
        CartItem.where(customer_id: current_customer).delete_all
        redirect_to orders_thanks_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment)
  end

    def order_item_params
    params.require(:order_item).permit(:item_id,:order_id,:customer_id,:number,:price)
end

  
end





# @orders = Order.とってくる

# view
# @orders.each do |order|
#   配送先：order.address
#   order.order_items.each do |order_item|
#     byebug

# サーバ再起動
# order/indexをリロード
# 処理がとまる
# ターミナルに戻って
# nで処理を進める
# 指定の場所lに止まったら　order_item とターミナルに入力s
