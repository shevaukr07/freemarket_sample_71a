class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :header_data

  def header_data
    @parents = Category.where(ancestry: nil).limit(13)
    @brands = Brand.all
  end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
      # devise_parameter_sanitizer.permit(:edit, keys: [])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
    end
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
