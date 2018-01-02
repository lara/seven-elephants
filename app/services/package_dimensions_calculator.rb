class PackageDimensionsCalculator
  def initialize(order)
    @order = order
  end

  def package_dimensions
    volumes = @order.order_products.joins(:product).pluck(:quantity, :length, :width, :height)
    items = []
    volumes.each do |order_product|
      order_product.first.times do
        items << { dimensions: [order_product[1], order_product[2], order_product[3]] }
      end
    end
    EasyBoxPacker.find_smallest_container(items: items)
  end
end
