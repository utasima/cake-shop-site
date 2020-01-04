class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update, :destroy,]
  # before_action :if_not_admin

  def index
    @item = Item.new
    @items = Item.all
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
    @item.deleted_at = true
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

  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description,:deleted_at, :image)
  end
end
