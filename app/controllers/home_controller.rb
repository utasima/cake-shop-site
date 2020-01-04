class HomeController < ApplicationController
  def index
    @items = Item.all
  end

  def about
  end

end
