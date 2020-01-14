class Api::OrdersController < ApplicationController

  def show
    @order = Order.find_by(order_number: params[:order_number])

    render json: { result: 'SUCCESS', message: 'getData', order: @order }
  end

  def create
    @order = Order.new(order_params)
    
    if @order.save
      render json: { result: 'SUCCESS', order: @order }
    else
      render json: { result: 'FAIL', messages: @order.errors.full_messages, order: @order}
    end
  end
  
  def update
    @order = Order.find_by(order_number: params[:order_number])
    
    if @order.update_attributes(order_params)
      render json: { result: 'SUCCESS', order: @order }
    else
      render json: { result: 'FAIL', messages: @order.errors.full_messages, order: @order}
    end
  end

  # ForbiddenAttributesError対処
  private
    def order_params
      params.require(:order).permit(:sample_image_id, :order_number, :order_status, :delflg, :flame_size, :premium_wrapping, :price, :name_kanji, :name_furigana, :email, :line_id, :cell_phone_number, :home_phone_number, :postal_code, :address1, :address2, :comment)  
    end

end