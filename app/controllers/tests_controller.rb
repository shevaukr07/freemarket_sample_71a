class TestsController < ApplicationController
  def index
    @items_top = Item.where(purchase_id: nil).order(updated_at: :desc).limit(3)
    @items_down = Item.where(purchase_id: nil).order(updated_at: :asc).limit(3)
    @parents = Category.where(ancestry: nil).limit(13)
    @brands = Brand.all
  end

  def new
    @uesr = User.find(params[:current_user.id])
  end

  def show
    @user = user.find(params[:id])
  end
  def test
  end

  def bought
    @user = User.find(current_user.id)
    @items = Item.where(buyer_id: @user,purchase_id:1)
  end

  def sold
    @user = User.find(params[:id])
    @items = Item.where(seller_id: @user)
  end
end
