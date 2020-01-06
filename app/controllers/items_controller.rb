class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]
  before_action :set_item, only: [:show, :cancel]
  def index
    @items = Item.all
    @genre = Genre.where(deleted_at: nil)
    @search = Item.search(params[:search])
  end

  def genre_search
    @items = Item.where(genre_id: params[:genre])
    @genre = Genre.where(deleted_at: nil)
    @genre_name = Genre.find(params[:genre])
    render :index
  end

  def show
    @item = Item.find(params[:id])
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
