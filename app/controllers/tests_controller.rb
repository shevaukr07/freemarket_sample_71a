class TestsController < ApplicationController
  def index

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
    @user = User.find(current_user.id)
    # @items = Item.where(seller_id: @user,purchase_id:nil)
    @items = Item.where(seller_id: @user)
    # redirect_to sold_tests_path
    redirect_to root_path
  end
end
