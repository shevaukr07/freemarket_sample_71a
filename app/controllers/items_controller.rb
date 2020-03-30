class ItemsController < ApplicationController
  require 'payjp'

  def index
    @items = Item.where(purchase_id: nil)
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
    @my_items = Item.where(seller_id: @item.seller_id)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.valid?
      flash[:alert] = "必須項目を確認してください"
      redirect_to new_item_path and return
    end
    @item.save
    flash[:notice] = "出品が完了しました"
    redirect_to root_path and return
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @new_item = Item.new(item_update_params)
    unless @new_item.valid?
      flash[:alert] = "必須項目を確認してください"
      redirect_to edit_item_path and return
    end
    @item.update(item_update_params)
    flash[:notice] = "編集が完了しました"
    redirect_to root_path and return
  end

  def destroy
    @item =Item.find(params[:id])

    

    if @item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to items_path
    else
      redirect_to item_path(@item)
    end

  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
      @category_grandchildren = Category.find(params[:child_id]).children
  end
  private

  def item_params
    params.require(:item).permit(:name, :price, :introduce, :brand_id, :category_id, :size_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, item_images_attributes: [:image]).merge(seller_id: current_user.id).merge(buyer_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :price, :introduce, :brand_id, :size_id, :category_id, :commodity_condition_id, :shipping_charge_id, :shipping_method_id,:prefecture_id, :shipping_day_id, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id).merge(buyer_id: current_user.id)
  end

  def purchase

    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: 111,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to root_path, notice: "支払いが完了しました"
  end

end
