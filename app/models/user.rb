class User < ApplicationRecord
  # E-mail フォーマット
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: :true 
end
