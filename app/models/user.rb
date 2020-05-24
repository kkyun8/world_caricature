# frozen_string_literal: true

# class User < ApplicationRecord
class User < ActiveRecord::Base
  #has_secure_password
  #has_many :sns_credential, dependent: :destroy
  #has_many :sample_image
  has_secure_password
  has_many :sns_credential, dependent: :destroy
  has_many :sample_image


  devise :trackable, :omniauthable, omniauth_providers: %i[facebook google]

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    # TODO: バグ修正
    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     auth.to_yaml)
    end
    user
  end
end