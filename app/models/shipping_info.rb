class ShippingInfo
  include ActiveModel::Model

  attr_accessor(
    :order,
    :customer_name,
    :customer_phone_number,
    :place_id,
    :address_2,
  )

  validates :customer_name, presence: true, length: { maximum: 100 }
  validates :customer_phone_number, presence: true, format: /\d+/
  validates :place_id, presence: true

  def confirm
    if valid?
      order.update!(
        customer_name: customer_name,
        customer_phone_number: customer_phone_number,
        place_id: place_id,
        address: full_address,
      )
    end
  end

  private

  def full_address
    if address_2.present?
      spot.formatted_address + ", Apt./Suite: " + address_2.to_s
    else
      spot.formatted_address
    end
  end

  def spot
    client = GooglePlaces::Client.new(ENV.fetch("GOOGLE_API_KEY"))
    client.spot(place_id)
  end
end
