class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?




  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
      devise_parameter_sanitizer.permit(:edit, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
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
