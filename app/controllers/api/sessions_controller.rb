# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsHelper

  def new; end
  # TODO: セッション処理
  def create
    user = User.find_by(email: session_params[params[:email]])
    #user = User.find_by(email: params[:session][:email].downcase)
    # if user&.authenticate(params[:session][:password])
    if user&.authenticate(session_params[params[:password]])
      # log_in user
      # redirect_to root_url
      session[:email] = user.email

      render json: { result: 'SUCCESS', user: @user }
    else
      # messages: @user.errors.full_messages, 
      render json: { result: 'FAIL', user: @user}
    end
  end

  def destroy
    log_out if logged_in?
    reset_session
    render json: { result: 'SUCCESS', user: @user }
  end
  
  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
