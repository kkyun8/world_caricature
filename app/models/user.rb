# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :sns_credential, dependent: :destroy

  has_many :sample_image
end
