class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]
  before_action :set_item, only: [:show, :cancel]
  def index
    @items = Item.all
  end

  def show
    @cart = CartItem.new
    @number = [*1..100]
    @customer = Customer.find(current_customer.id)
  end

  def cancel
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
end
