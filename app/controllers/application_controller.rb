# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # TODO:
  # ログイン必須？
  # before_action :login_required

  # sns 認証
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception
  
  # private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end
end
