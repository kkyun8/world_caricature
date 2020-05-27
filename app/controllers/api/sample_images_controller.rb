# frozen_string_literal: true

class Api::SampleImagesController < ApplicationController
  # require 'aws-sdk-s3'

  def index
    # TODO: AWS download
    # s3 = Aws::S3::Resource.new(region: 'us-west-2')

    # Create the object to retrieve
    # obj = s3.bucket('my-bucket').object('my-item')

    # Get the item's content and save it to a file
    # obj.get(response_target: './my-code/my-item.txt')

    # @sample_images = SampleImage.where(delflg: 0).where("id >= :start", {params[:start]}).limit(8).order('updated_at DESC')
    # @sample_images = SampleImage.where(delflg: 0).where("id > #{params[:start]}").limit(8).order('updated_at DESC')
    @sample_images = SampleImage.where(delflg: 0)
    render json: { result: 'SUCCESS', message: 'Loaded', sample_images: @sample_images }
  end

  def show
    @sample_image = SampleImage.where(delflg: 0).find(params[:id])
    render json: { result: 'SUCCESS', message: 'getData', sample_image: @sample_image }
  end

  def create
    # param[:uploaded_image]
    # TODO: AWS upload
    # s3 = Aws::S3::Resource.new(region: 'us-west-2') # tokyo
    # # uploadfile
    # file = 'filename'
    # bucket = ENV['SAMPLE_IMAGE_BUCKET']

    # # Get just the file name
    # name = File.basename(file)

    # # Create the object to upload
    # obj = s3.bucket(bucket).object(name)

    # # Upload it
    # obj.upload_file(file)

    @sample_image = SampleImage.new(sample_image_params)

    if @sample_image.save
      render json: { result: 'SUCCESS', sample_images: @sample_image }
    else
      render json: { result: 'FAIL', message: @sample_image.errors.full_message, sample_images: @sample_image }
    end
  end

  # private

  # def sample_image_params
  #   params.require(:sample_images).permit(:name, :information, :order_type, :price, :number_of_people, :image_url)
  # end
end
