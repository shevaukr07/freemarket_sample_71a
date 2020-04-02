# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = "必須項目を確認してください"
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    flash.now[:notice] = "住所を入力して下さい"
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = "必須項目を確認してください"
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    binding.pry
    @user.save
    sign_in(:user, @user)
    flash[:notice] = "登録が完了しました"
    redirect_to root_path
    # session["address"] = @address.attributes
    # @creditcard = @user.build_card
    # render :new_creditcard
  end

  def create_creditcard
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(session["address"])
    @creditcard = Card.new(creditcard_params)
    unless @creditcard.valid?
      flash.now[:alert] = @creditcard.errors.full_messages
      render :new_creditcard and return
    end
    @user.build_address(@address.attributes)
    @user.build_card(@creditcard.attributes)
    @user.save
    sign_in(:user, @user)
    redirect_to root_path
  end

  def address_params
    params.require(:address).permit(:address,:postal_code, :prefecture_id, :city, :apartment)
  end

  def creditcard_params
    params.require(:card).permit(:card_company,:card_number, :card_year, :card_month, :card_pass)
  end

end
