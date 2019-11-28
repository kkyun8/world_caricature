class Api::OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.save

      render json: { result: 'SUCCESS', order: @order }
    else
      render json: { result: 'FAIL', messages: @order.errors.full_messages, order: @order}
    end

    # @object = Object.new(params[:object])
    # if @object.save
    #   flash[:success] = "Object successfully created"
    #   redirect_to @object
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'new'
    # end
  end
  
  # ForbiddenAttributesError対処
  private
    def order_params
      params.require(:order).permit(:sample_image_id, :order_number, :order_status, :flame_size, :premium_wrapping, :price, :name_kanji, :name_furigana, :email, :line_id, :cell_phone_number, :home_phone_number, :postal_code, :address1, :address2, :comment)  
    end

end