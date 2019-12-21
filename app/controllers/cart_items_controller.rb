class CartItemsController < ApplicationController
  def index
    @user = current_customer
    end

  def create
    @cart = CartItem.new(cart_item_params)
    @cart.save
  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_items_path
  end

  def update
  end

  def edit
    @item = Item.find(params[:id])
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:number,:item_id,:customer_id)
    end
end
