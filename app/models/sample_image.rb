# frozen_string_literal: true

class SampleImage < ApplicationRecord
  validates :name, presence: true
  has_many_attached :images

  # belong_to :user
end
