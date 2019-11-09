class Api::SampleImagesController < ApplicationController

  def index
    @sample_images = SampleImage.order('updated_at DESC')
  end

end