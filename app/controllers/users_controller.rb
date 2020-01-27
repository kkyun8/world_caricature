class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { result: 'SUCCESS', user: @user }
    else
      render json: { result: 'FAIL', messages: @user.errors.full_messages, user: @user}
    end
  end
  
  def edit
    
  end

  def update
    
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :type)
    end
end
