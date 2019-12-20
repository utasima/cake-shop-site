class Admin::ItemsController < ApplicationController
  def new
  end

  def index
  end

  def destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
  end

  def update
  end
  
  def create
  end

end
