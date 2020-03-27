class TestsController < ApplicationController
  def index

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
