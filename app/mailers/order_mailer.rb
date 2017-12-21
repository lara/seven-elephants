class OrderMailer < ApplicationMailer
  default from: "orders@seven-elephants.co"

  def order_placed_email(order)
    @order = order
    mail(to: @order.email, subject: "Your Seven Elephants Order Confirmation")
  end
end
