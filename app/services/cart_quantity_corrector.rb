class CartQuantityCorrector
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def correct_quantities
    order_products_with_product.each do |order_product|
      if order_product.quantity > order_product.product.stock_quantity
        order_product.update(quantity: order_product.product.stock_quantity)
        flash[:notice] = "We had to remove some of the items from your cart because they are no longer in stock!"
      end

      if order_product.quantity == 0
        order_product.destroy
      end
    end
  end

  def order_products_with_product
    order.order_products.includes(:product)
  end
end
