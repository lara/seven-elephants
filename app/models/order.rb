class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  scope :placed, -> { none }
  scope :shipped, -> { where.not(shipped_at: nil) }
  scope :cancelled, -> { where.not(cancelled_at: nil) }
  scope :cart, -> { where(placed_at: nil) }

  def total
    order_products.sum("price * quantity")
  end

  def add_order_product(options = {})
    current_item = order_products.find_by(product: options[:product])

    if current_item
      current_item.quantity += options[:quantity].to_i
      current_item.save!
    else
      order_products.create!(
        product: options[:product],
        quantity: options[:quantity],
        price: options[:product].price,
      )
    end
  end

  def number_of_items
    order_products.sum(:quantity)
  end
end
