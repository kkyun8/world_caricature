# frozen_string_literal: true

class SampleImage < ApplicationRecord
  validates :name, presence: true
  has_many_attached :images

  # get S3 key
  def images_key
    images_array = []
    if images.attached?
      sample = { 'id' => id }
      images_key = []

      images.each do |image|
        images_key.push(image.key)
      end
      sample['images_key'] = images_key
      images_array.push(sample)
    end
    images_array
  end
  # belong_to :user
end
