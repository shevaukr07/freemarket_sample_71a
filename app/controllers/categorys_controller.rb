class CategorysController < ApplicationController
  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @items = Item.where(category_id: params[:id])
  end
end
