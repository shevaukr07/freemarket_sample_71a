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
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    session["address"] = @address.attributes
    @creditcard = @user.build_creditcard
    render :new_credit_card
  end

  def create_creditcard
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(session["address"])
    @creditcard = Creditcard.new(creditcard_params)
    unless @creditcard.valid?
      flash.now[:alert] = @creditcard.errors.full_messages
      render :new_credit_card and return
    end
    @user.build_address(@address.attributes)
    @user.build_creditcard(@creditcard.attributes)
    @user.save
    sign_in(:user, @user)
  end

end
