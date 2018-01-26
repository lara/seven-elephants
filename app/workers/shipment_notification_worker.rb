class ShipmentNotificationWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    return unless order.shipped?
    # OrderMailer.order_shipped_email(order).deliver_now
  end
end
