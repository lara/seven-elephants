module Admin
  class OrdersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    # end

    def ship
      order = Order.find(params[:order_id])
      order.update(shipped_at: Time.now)
      flash[:notice] = "Order ##{order.id} is marked as shipped."
      redirect_back fallback_location: :index
    end

    def cancel
      order = Order.find(params[:order_id])
      order.update(cancelled_at: Time.now)
      flash[:notice] = "Order ##{order.id} is marked as cancelled."
      redirect_back fallback_location: :index
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Order.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def scoped_resource
      Order.placed
    end

    def valid_action?(name, resource = resource_class)
      %w[new edit destroy].exclude?(name.to_s) && super
    end
  end
end
