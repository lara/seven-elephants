module Admin
  class OrderProductsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = OrderProduct.
    #     page(params[:page]).
    #     per(10)
    # end
    before_action :redirect_to_product

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   OrderProduct.find_by!(slug: param)
    # end
    private

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def redirect_to_product
      order_product = OrderProduct.find(params[:id])
      redirect_to admin_product_path(order_product.product)
    end
  end
end
