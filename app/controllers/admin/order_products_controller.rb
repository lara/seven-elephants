module Admin
  class OrderProductsController < Admin::ApplicationController
    before_action :redirect_to_product

    private

    def redirect_to_product
      order_product = OrderProduct.find(params[:id])
      redirect_to admin_product_path(order_product.product)
    end
  end
end
