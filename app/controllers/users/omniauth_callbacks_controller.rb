class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback :facebook
  end

  def google
    callback :google
  end 

  def twitter
    callback :google
  end 

  def line
    callback :google
  end 

  def callback(provider)
    @user = User.find_for_google(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: provider.capitalize
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path && return
  end
end