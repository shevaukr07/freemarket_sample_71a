class FavoritesController < ApplicationController

  def index
    @items = current_user.items
  end
    
  def create
    user = current_user
    item = Item.find(params[:item_id])
    if Favorite.create(user_id: user.id,item_id:item.id)
      flash[:notice] = "お気に入りに登録しました"
    redirect_to items_path
    else
      redirect_to root_path
    end

  end

  def destroy
    user = current_user
    item = Item.find(params[:item_id])
    if favorite = Favorite.find_by(user_id: user.id,item_id:item.id)
      favorite.delete
      flash[:notice] = "お気に入りから削除しました"
      redirect_to item_favorites_path
    else
      redirect_to root_path
    end
  end
end

