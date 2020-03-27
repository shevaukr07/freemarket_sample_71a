class Item::SecoundController < ApplicationController
  def index

  end

  def show
    @item = Item.find(params[:id])
  end


  def sold
    @user = User.find(params[:id])
    @items = Item.where(seller_id: @user)
  end
end
