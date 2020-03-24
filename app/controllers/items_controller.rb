class ItemsController < ApplicationController
  require 'payjp'

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
  def purchase
    # Payjp.api_key = "sk_test_322f9158a6159e107c587430"
    # Payjp::Charge.create(
    #   amount: 111, 
    #   card: params['payjp-token'], 
    #   currency: 'jpy'
    # )
    # redirect_to root_path, notice: "支払いが完了しました"
    binding.pry
    Payjp.api_key = "sk_test_322f9158a6159e107c587430"
    Payjp::Charge.create(currency: 'jpy', amount: 111, card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end
  
end



  