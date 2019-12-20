class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy,] #:cancel
  
  def index
    @items = Item.all
  end

  def show
    @cart = CartItem.new
    @number = [*1..100]
  end

  def cancel
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @items = Item.all
      @item = Item.find(@item)
      render action: :index
    end
  end
  
  def update
    if 
      @item.update(item_params)
      redirect_to admin_item_path(@item), notice: 'CAKE was successfully updated.'
    else
      render action: :edit
    end
  end
  
  def destroy
    @item.destroy
    redirect_to admin_items_path
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    
    def item_params
        params.require(:item).permit(:name, :price, :description, :is_deleted, :image)
    end
end
