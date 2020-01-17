class Api::PaymentsController < ApplicationController

  def show
    @payment = Payment.where(payment_flg: 0).find(params[:order_number])
    render json: { result: 'SUCCESS', message: 'getData', patment: @payment }
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      #完了メール発送 TODO:
      ContactMailer.payment_success_mail_for_user(@payment.order_number).deliver
      render json: { result: 'SUCCESS', payment: @payment }
    else
      render json: { result: 'FAIL', messages: @payment.errors.full_messages, payment: @payment}
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:order_number, :order_id, :sample_image_id, :price, :payment_flg, :payment_options)
    end
    
end