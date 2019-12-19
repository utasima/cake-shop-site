class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params:[id])
    @user = current_user
    @user.Cart_item = @item.id
    
  end
end
