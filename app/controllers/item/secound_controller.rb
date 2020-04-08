class Item::SecoundController < ApplicationController
before_action :buyer?, only: [:show]
before_action :configure_sign_up_params, only: [:create]

  def index

  end

  def show
    @item = Item.find(params[:id])

    # pay.jpのカード参照用記述
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
    #   redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.secrets.payjp_private_key
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
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
