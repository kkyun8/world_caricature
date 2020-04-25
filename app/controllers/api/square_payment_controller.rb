class Api::SquarePaymentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def charge_card
    require 'square'
    require 'securerandom'
  
    # Create an instance of the API Client and initialize it with the credentials
    # for the Square account whose assets you want to manage.
    api_client = Square::Client.new(
      access_token: ENV["SQUARE_ACCESS_TOKEN"],
      environment: 'sandbox'
    )

    # To learn more about splitting payments with additional recipients,
    # see the Payments API documentation on our [developer site]
    # (https://developer.squareup.com/docs/payments-api/overview).
    # Charge 1 dollar (100 cent)
    request_body = {
      :source_id => params[:nonce],
      :amount_money => {
        :amount => params[:price].to_i, #set amount 
        :currency => 'JPY' #update USD ->JPY 
      },
      :idempotency_key => SecureRandom.uuid
    }

    resp = api_client.payments.create_payment(body: request_body)
    if resp.success?
      @square_payment = resp.data.payment

      if @square_payment[:status] == "COMPLETED"
        @payment = Payment.new(order_number: params[:order_number], order_id: params[:order_id], sample_image_id: params[:sample_image_id], price: params[:price],
          currency: @square_payment[:amount_money][:currency], source_type: @square_payment[:source_type], card_brand: @square_payment[:card_details][:card][:card_brand], last_4: @square_payment[:card_details][:card][:last_4],
          square_created_at: @square_payment[:created_at], square_id: @square_payment[:id], square_order_id: @square_payment[:order_id],
          receipt_number: @square_payment[:receipt_number], receipt_url: @square_payment[:receipt_url] )

        if @payment.save
          render json: { result: 'SUCCESS', payment: @payment }
        else
          render json: { result: 'FAIL', error: @payment }
        end
      else
        render json: { result: 'FAIL', error: @square_payment }
      end
    else
      @error = resp.errors
      logger.debug(resp.errors)
      render json: { result: 'FAIL', error: @error}
    end
  end
end