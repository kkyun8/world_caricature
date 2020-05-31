# frozen_string_literal: true

class Api::SampleImagesController < ApplicationController
  require 'aws-sdk'

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
    # file = params[:file]
    # b64_image = Base64.strict_encode64(file)

    # bucket = ENV['SAMPLE_IMAGES_BUCKET']
    # file_name = 'test1.jpg'

    # # b64_image = Base64.strict_encode64(file)
    # s3 = Aws::S3::Resource.new(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
    # obj = s3.bucket(bucket).object(file_name)
    # # TODO: local fileではないとアップロードできない
    # obj.upload_file(file)

    @sample_image = SampleImage.create(sample_image_params)
    if @sample_image.save
      render json: { result: 'SUCCESS', sample_images: @sample_image }
    else
      render json: { result: 'FAIL', message: @sample_image.errors.full_message, sample_images: @sample_image }
    end
  end

  private

  def sample_image_params
    params.require(:sample_images).permit(:name, :information, :order_type, :price, :number_of_people, :image_url)
  end
end
