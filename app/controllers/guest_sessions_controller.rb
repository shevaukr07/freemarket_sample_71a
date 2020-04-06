class GuestSessionsController < ApplicationController
  def create
    @user = User.find_by(email: 'test@buy')
    sign_in(:user, @user)
    flash[:notice] = 'ゲスト購入ユーザーでログインしました'
    redirect_to root_path
  end

  def create2
    @user = User.find_by(email: 'test@sell')
    sign_in(:user, @user)
    flash[:notice] = 'ゲスト出品ユーザーでログインしました'
    redirect_to root_path
  end
end
