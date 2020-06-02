# frozen_string_literal: true

class Api::SampleImagesController < ApplicationController
  def index
    @sample_images = SampleImage.where(delflg: 0)

    render json: { result: 'SUCCESS', message: 'Loaded', sample_images: @sample_images }
  end

  def show
    @sample_image = SampleImage.where(delflg: 0).find(params[:id])

    render json: { result: 'SUCCESS', message: 'getData', sample_image: @sample_image }
  end

  def create
    @sample_image = SampleImage.new(sample_image_params)

    if @sample_image.save
      render json: { result: 'SUCCESS', sample_images: @sample_image }
    else
      render json: { result: 'FAIL', message: @sample_image.errors.full_message, sample_images: @sample_image }
    end
  end

  private

  def sample_image_params
    params.permit(:name, :information, :order_type, :price, :number_of_people, :image_url, :image)
  end
end
