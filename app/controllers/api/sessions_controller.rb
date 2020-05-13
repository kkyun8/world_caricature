# frozen_string_literal: true

class Api::SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[params[:email]])

    if user&.authenticate(session_params[params[:password]])
      render json: { result: 'SUCCESS', user: user }
    else
      render json: { result: 'FAIL', user: user}
    end
  end

  def destroy
    reset_session
    render json: { result: 'SUCCESS', user: @user }
  end
  
  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
