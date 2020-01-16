class Api::LineController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'line/bot'

  def send_message

    p '注文確定送信'
    
    #オーダ作成後、ラインに通知
    message = {
      type: 'text',
      text: '注文ありがとうございます！ラインから注文管理できます。'
    }
  
    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_ACCESS_TOKEN"]
    }
    response = client.push_message(params[:id], message)
    p response

    render json: { result: 'SUCCESS'}
  end
end