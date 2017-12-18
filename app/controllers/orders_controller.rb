class OrdersController < ApplicationController
  def current
    cart_quantity_corrector = CartQuantityCorrector.new(@order)
    cart_quantity_corrector.correct_quantities

    if cart_quantity_corrector.changed_quantities?
      flash[:notice] = "We had to remove some of the items from your cart because they are no longer in stock!"
    end

    @order_products_with_product = @order.order_products.includes(:product).order(created_at: :desc)
  end
end
