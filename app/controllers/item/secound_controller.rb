class Item::SecoundController < ApplicationController
before_action :buyer?, only: [:show]
before_action :configure_sign_up_params, only: [:create]

  def index

  end

  def show
    @item = Item.find(params[:id])
  end

  def bought
    @items = Item.where(buyer_id: params[:id],purchase_id:1)
  end

  def sold
    @user = User.find(params[:id])
    @items = Item.where(seller_id: @user)
  end

  def buyer?
    @item = Item.find(params[:id])
    redirect_to item_path(@item) if current_user.id == @item.seller_id
  end


end
