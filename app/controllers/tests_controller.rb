class TestsController < ApplicationController
  def index
    @items_top = Item.order(updated_at: :desc).limit(3)
    @items_down = Item.order(updated_at: :asc).limit(3)
  end

  def new

  end

  def test

  end
  def bought
    @user = User.find(params[:id])
    @items = Item.where(seller_id: @user)
  end
  def sold

  end
end
