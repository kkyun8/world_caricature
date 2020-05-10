class Api::UsersController < ApplicationController
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      render json: { result: 'SUCCESS', user: @user }
    else
      render json: { result: 'FAIL', messages: @user.errors.full_messages, user: @user}
    end
  end

  # private TODO: has_secure_passwordと同時に利用したら、エラー

  # def user_params 
  #   params.require(:user).permit(:name, :email, :password_digest)
  # end
end
