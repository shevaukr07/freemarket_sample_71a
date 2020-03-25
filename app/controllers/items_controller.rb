class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduce, :brand, :size, :commodity_condition, :shipping_charge, :shipping_mathod,:prefecture_id, :shipping_day, item_images_attributes: [:image])
    # params.require(:item).require(:item_images_attributes).require(:"0").permit(:image)
  end

end
