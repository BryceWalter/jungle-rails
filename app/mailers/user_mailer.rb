class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(order)

    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: "Order ID: #{@order.id}")
  end
end
