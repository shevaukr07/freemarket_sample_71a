class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item_images = ItemImage.new
  end
  def show
  
  end
  def index
  end
  def create
  end
end
  