# frozen_string_literal: true

class SampleImage < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image_url
  # belong_to :user
end
