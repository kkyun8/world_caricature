class ContactMailer < ApplicationMailer
  def order_create_mail(order_number)
    @order = Order.find_by(order_number)
    mail to: @order.email, subject: '【注文登録通知メール】ワルード似顔絵' 
  end

  def payment_success_mail_for_user(order_number)
    @order = Order.find_by(order_number)
    mail to: @order.email, subject: '【決済完了メール】ワルード似顔絵' 
  end

  def payment_success_mail_for_artist(order_number)
    @order = Order.find_by(order_number)
    # SampleImage.find_by??
    mail to: @order.email, subject: '【注文通知メール】ワルード似顔絵' 
  end
end
