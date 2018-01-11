class ShippingInfo
  include ActiveModel::Model

  attr_accessor(
    :order,
    :customer_name,
    :customer_phone_number,
    :place_id,
  )

  validates :customer_name, presence: true
  validates :customer_phone_number, presence: true
  validates :place_id, presence: true

  def confirm
    if valid?
      order.update!(
        customer_name: customer_name,
        customer_phone_number: customer_phone_number,
        place_id: place_id,
      )
    end
  end
end
