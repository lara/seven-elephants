class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total
    price * quantity
  end
end
