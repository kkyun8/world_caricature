# frozen_string_literal: true

class SampleImage < ApplicationRecord
  validates :name, presence: true

  # belong_to :user
end
