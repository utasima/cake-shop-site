class CartItemsController < ApplicationController
  def index
  end

  def create
    @cart = CartItem.new(cart_item_params)
    @cart.save
  end

  def destroy
  end

  def update
  end

  def edit 
    @item = Item.find(params[:id])
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:number,:item_id)
    end
end
