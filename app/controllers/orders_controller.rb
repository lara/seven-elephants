class OrdersController < ApplicationController
  def current
    CartQuantityCorrector.new(@order).correct_quantities
    @order_products_with_product = @order.order_products.includes(:product).order(created_at: :desc)
  end
end
