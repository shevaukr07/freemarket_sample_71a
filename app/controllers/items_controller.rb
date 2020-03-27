class ItemsController < ApplicationController
  require 'payjp'

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduce, :brand_id, :category_id, :size_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, item_images_attributes: [:image]).merge(seller_id: current_user.id).merge(buyer_id: current_user.id)
  end


  def purchase
    Payjp::Charge.create(
      amount: 111,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to root_path, notice: "支払いが完了しました"

  end

end
