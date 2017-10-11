class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(order)

    @order = order
    @url  = 'http://example.com/login'
    mail(to: 'brycewalterparker@gmail.com', subject: "Order ID: #{@order.id}")
  end
end
