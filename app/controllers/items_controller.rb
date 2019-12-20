class ItemsController < ApplicationController
  def index
  end

  def show
    @cart = CartItem.new
    @number = [*1..100]
    @item = Item.find(params[:id])
  end
  

end
