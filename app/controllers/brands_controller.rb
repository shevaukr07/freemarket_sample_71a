class BrandsController < ApplicationController
  def show
    @items = Item.where(brand_id: params[:id])
  end
end
