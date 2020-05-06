# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  # TODO: dbに反映
  self.primary_keys = :name, :email
  # E-mail フォーマット
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # validates :password, presence: true, uniqueness: true
  # , primary_key: [:fuga, :piyo]
end
