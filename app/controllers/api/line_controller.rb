class Api::LineController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'line/bot'

  # 注文成功
  def order_create_to_user

    p '注文作成通知'
    
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

  def payment_success_to_user

    p 'ユーザーに決済完了通知'
    
    #オーダ作成後、ラインに通知
    message = {
      type: 'text',
      text: '決済を完了しました！ご注文ありがとうございます！ラインで写真を送信してください！'
    }

    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_ACCESS_TOKEN"]
    }

    response = client.push_message(params[:id], message)
    p response

    render json: { result: 'SUCCESS'}

  end

  def payment_success_to_artist(order_number)
    #担当作家に通知

    #TODO:
    @order = Order.find_by(order_number)
    # TODO: sample_image_id = artist_mail or artist_line_id get
    p '担当アーティストにに決済完了通知'
    
    #オーダ作成後、ラインに通知
    message = {
      type: 'text',
      text: '決済を完了しました！ご注文ありがとうございます！ラインで写真を送信してください！'
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