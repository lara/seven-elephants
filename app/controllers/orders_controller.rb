class OrdersController < ApplicationController
  def current
    cart_quantity_corrector = CartQuantityCorrector.new(@order)
    cart_quantity_corrector.correct_quantities

    if cart_quantity_corrector.changed_quantities?
      flash[:notice] = "We had to remove some of the items from your cart because they are no longer in stock!"
    end

    @order_products_with_product = @order.order_products.by_created_at
  end

  def shipping_rates_index
    @shipping_rates = shipping_rates
  rescue ShippingRatesCalculator::PackageTooHeavyError
    @package_too_heavy = true
  end

  def update_shipping_method
    @order.update!(
      shipping_method: chosen_shipping_rate.service_name,
      shipping_cost: chosen_shipping_rate.price,
    )
    redirect_to checkout_path
  end

  def checkout; end

  private

  def shipping_rates
    ShippingRatesCalculator.new(@order).shipping_rates
  end

  def chosen_shipping_rate
    shipping_rates.detect { |rate| rate.service_code == params[:service_code] }
  end
end
