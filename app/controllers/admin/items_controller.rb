class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update, :destroy,]
  def index
    @item = Item.new
    @items = Item.with_deleted
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      puts @item.errors.full_messages
      render action: :new
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

  def regeneration
    @item = Item.with_deleted.find(params[:id])
    @item.restore
    redirect_to admin_items_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :deleted_at, :image, :genre_id)
  end
end
