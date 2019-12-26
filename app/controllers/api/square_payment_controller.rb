class Api::SquarePaymentController < ApplicationController
  skip_before_action :verify_authenticity_token
  def charge_card

    # Create an instance of the API Client and initialize it with the credentials
    # for the Square account whose assets you want to manage.
    api_client = Square::Client.new(
      access_token: Rails.application.secrets.square_access_token,
      environment: ENV['IS_PRODUCTION'] == 'false' ? 'sandbox' : 'production'
    )

    # To learn more about splitting payments with additional recipients,
    # see the Payments API documentation on our [developer site]
    # (https://developer.squareup.com/docs/payments-api/overview).
    # Charge 1 dollar (100 cent)
    request_body = {
      :source_id => params[:nonce],
      :amount_money => {
        :amount => 1000, #TODO: set amount params
        :currency => 'JPY' #update USD ->JPY 
      },
      :idempotency_key => SecureRandom.uuid
    }

    resp = api_client.payments.create_payment(body: request_body)
    if resp.success?
      @payment = resp.data.payment
    else
      @error = resp.errors
    end
  end
end