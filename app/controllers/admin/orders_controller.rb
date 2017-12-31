module Admin
  class OrdersController < Admin::ApplicationController
    def ship
      order = Order.find(params[:order_id])
      order.update(shipped_at: Time.now)
      ShipmentNotificationWorker.perform_in(10.seconds, order.id)
      flash[:notice] = "Order ##{order.id} is marked as shipped."
      redirect_back fallback_location: :index
    end

    def cancel
      order = Order.find(params[:order_id])
      order.update(cancelled_at: Time.now)
      flash[:notice] = "Order ##{order.id} is marked as cancelled."
      redirect_back fallback_location: :index
    end

    private

    def scoped_resource
      Order.placed
    end

    def valid_action?(name, resource = resource_class)
      %w[new edit destroy].exclude?(name.to_s) && super
    end
  end
end
