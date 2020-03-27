class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    # @item.purchase_id = 1 #購入済みに数字(1)を入れる
    # @item.buyer_id = current_user.id #購入者代入
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    # binding.pry
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    # redirect_to action: 'done' #完了画面に移動
    # @item.save
    @item.update(purchase_id: 1, buyer_id: current_user.id)
    binding.pry
    redirect_to done_purchase_path(@item) #完了画面に移動
  end
  def done
    @item = Item.find(params[:id])
    binding.pry
  end

end
