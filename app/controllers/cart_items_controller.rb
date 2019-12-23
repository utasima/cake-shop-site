class CartItemsController < ApplicationController
  def index
    @user = current_customer
    @number = CartItem.new
    
  end

  def create
    @cart = CartItem.new(cart_item_params)
    @cart.save
    redirect_to cart_items_path
  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart = CartItem.where(customer_id: current_customer)
    @cart.destroy_all
    redirect_to cart_items_path
  end
  def update
    @number = CartItem.find(params[:id])
    @number.update(number: params[:number])
    redirect_to cart_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:number,:item_id,:customer_id)
  end
end
