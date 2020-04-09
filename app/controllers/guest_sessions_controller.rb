class GuestSessionsController < ApplicationController
  def create
    @user = User.find_by(email: 'test@buyer')
    if @user == nil
      flash[:notice] = 'ゲスト購入ユーザーが作成されていません。'
      redirect_to root_path
    else
      sign_in(:user, @user)
      flash[:notice] = 'ゲスト購入ユーザーでログインしました'
      redirect_to root_path
    end
  end

  def create2
    @user = User.find_by(email: 'test@seller')
    if @user == nil
      flash[:notice] = 'ゲスト購入ユーザーが作成されていません。'
      redirect_to root_path
    else
      sign_in(:user, @user)
      flash[:notice] = 'ゲスト購入ユーザーでログインしました'
      redirect_to root_path
    end
  end
end
