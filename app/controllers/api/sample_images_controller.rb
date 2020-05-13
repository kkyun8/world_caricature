class Api::SampleImagesController < ApplicationController

  def index
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
    #TODO:
    #権限確認
    @sample_image = SampleImage.new()
  end

  private
  def sample_image_params 
    #TODO: params.require(:user).permit(:name, :email, :password_digest)
  end
end