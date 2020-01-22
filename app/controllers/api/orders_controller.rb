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
      #TODO: ステータス1、削除フラグがfalse、メール送信希望なら,以下を実行
      if @order.order_status == '1' && @order.delflg == false && @order.communication_type == 'mail'
        # 保存後にメールを送信
        ContactMailer.order_create_mail(@order.order_number).deliver_now
      end
      render json: { result: 'SUCCESS', order: @order }
    else
      render json: { result: 'FAIL', messages: @order.errors.full_messages, order: @order}
    end
  end

  # ForbiddenAttributesError対処
  private
    def order_params
      params.require(:order).permit(:sample_image_id, :order_number, :order_status, :delflg, :flame_size, :premium_wrapping, :price, :name_kanji, :name_furigana, :email, :line_id, :communication_type, :cell_phone_number, :home_phone_number, :postal_code, :address1, :address2, :comment)  
    end

end