class OrderProduct < ApplicationRecord
  scope :with_products, -> { includes(:product) }

  scope :by_created_at, -> { order(created_at: :desc) }
  scope :by_product_name, -> { with_products.order("products.name desc") }

  belongs_to :product
  belongs_to :order
  validate :quantity_cannot_exceed_product_stock

  def total
    price * quantity
  end

  private

  def quantity_cannot_exceed_product_stock
    if quantity > product.stock_quantity
      errors.add(:quantity, "cannot be greater than the amount in stock")
    end
  end
end
