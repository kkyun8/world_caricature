class Api::SampleImagesController < ApplicationController

  def index
    @sample_images = SampleImage.where(delflg: 0).order('updated_at DESC')
    render json: { status: 'SUCCESS', message: 'Loaded', sample_images: @sample_images }
  end

  def show
    @sample_image = SampleImage.where(delflg: 0).find(params[:id])
    render json: { status: 'SUCCESS', message: 'getData', sample_image: @sample_image }
  end
  
end