class CartQuantityCorrector
  attr_reader :order

  def initialize(order)
    @order = order
    @changed = false
  end

  def correct_quantities
    order_products_with_product.each do |order_product|
      if order_product.quantity > order_product.product.stock_quantity
        order_product.update(quantity: order_product.product.stock_quantity)
        @changed = true
      end

      if order_product.quantity.zero?
        order_product.destroy
      end
    end
  end

  def order_products_with_product
    order.order_products.includes(:product)
  end

  def changed_quantities?
    @changed
  end
end
