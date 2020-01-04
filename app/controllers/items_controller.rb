class ItemsController < ApplicationController

  before_action :authenticate_customer!

  before_action :set_item, only: [:show, :cancel]

  def index
    @items = Item.all
    @genre = Genre.where(deleted_at: nil)
  end

  def show
    @cart = CartItem.new
    @number = [*1..100]
    @genre = Genre.where(deleted_at: nil)
  end


  def cancel
  end


  private
    def set_item
      @item = Item.find(params[:id])
    end
end
