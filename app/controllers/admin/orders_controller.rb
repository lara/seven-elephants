module Admin
  class OrdersController < Admin::ApplicationController
    def ship
      @order = order_object
      render locals: {
        page: Administrate::Page::Show.new(dashboard, Order.find(params[:order_id])),
      }
    end

    def confirm_shipping
      if TrackingNumberValidator.new(params[:order][:tracking_number]).check
        order_object.update(shipped_at: Time.now, tracking_number: params[:order][:tracking_number])
        ShipmentNotificationWorker.perform_in(10.seconds, order_object.id)
        flash[:notice] = "Order ##{order_object.id} is marked as shipped."
        redirect_to admin_order_path(order_object)
      else
        flash[:error] = "Please enter a valid tracking number."
        redirect_back fallback_location: :ship
      end
    end

    def cancel
      order_object.update(cancelled_at: Time.now)
      flash[:notice] = "Order ##{order_object.id} is marked as cancelled."
      redirect_back fallback_location: :index
    end

    private

    def order_object
      Order.find(params[:order_id])
    end

    def scoped_resource
      Order.placed
    end

    def valid_action?(name, resource = resource_class)
      %w[new edit destroy].exclude?(name.to_s) && super
    end
  end
end
