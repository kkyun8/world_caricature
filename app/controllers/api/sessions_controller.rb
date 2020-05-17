# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(session_params[:password])
      render json: { result: 'SUCCESS', user: user }
    else
      render json: { result: 'FAIL', messages: 'not match' }
    end
  end

  def destroy
    reset_session
    render json: { result: 'SUCCESS', user: @user }
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
