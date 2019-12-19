class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :cancel]

  def index
    @items = Item.all
  end

  def show
    @item = Item.new
  end

  def cancel
    
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    
    def item_params
        params.require(:item).permit(:title, :price, :description, :is_deleted, :image)
    end
end