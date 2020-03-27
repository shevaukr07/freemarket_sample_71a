class ItemsController < ApplicationController
  require 'payjp'

  def index
    # @items_data = []
    @items = Item.all

    # @items.each do |item|
    #   items = {}
    #   image = item.item_images.first
    #   # image = images[0]
    #   items[:item] = item
    #   items[:image] = image
    #   @items_data << items
    #   # binding.pry
    # end

  end

  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create

    @item = Item.new(item_params)
    unless @item.valid?
      redirect_to new_item_path and return
    end
    @item.save
    redirect_to root_path and return
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @new_item = Item.new(item_update_params)
    unless @new_item.valid?
      redirect_to edit_item_path and return
    end
    @item.update(item_update_params)
    redirect_to root_path and return
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduce, :brand_id, :category_id, :size_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, item_images_attributes: [:image]).merge(seller_id: current_user.id).merge(buyer_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :price, :introduce, :brand_id, :size_id, :category_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id).merge(buyer_id: current_user.id)
  end

  def purchase
    # Payjp.api_key = "sk_test_322f9158a6159e107c587430"
    # Payjp::Charge.create(
    #   amount: 111,
    #   card: params['payjp-token'],
    #   currency: 'jpy'
    # )
    # redirect_to root_path, notice: "支払いが完了しました"
    Payjp.api_key = "sk_test_322f9158a6159e107c587430"
    Payjp::Charge.create(currency: 'jpy', amount: 111, card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end

end
