class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { result: 'SUCCESS', user: @user }
    else
      render json: { result: 'FAIL', messages: @user.errors.full_messages, user: @user}
    end
  end
  # user.password_digest
  # password_confirmation
  # def new
  #   @user = User.new
  # end
  private
    def user_params
      params.require(:user).permit(:email, :password, :type, :password_confirmation)
    end
end
