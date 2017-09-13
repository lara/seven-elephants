class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  def total
    order_products.sum("price * quantity")
  end

  def add_order_product(options = {})
    current_item = OrderProduct.find_by(product: options[:product])

    if current_item
      current_item.quantity += options[:quantity].to_i
      current_item.save
    else
      order_products.create(
        product: options[:product],
        quantity: options[:quantity],
        price: options[:product].price,
      )
    end
  end
end
