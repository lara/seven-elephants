class ShippingRatesCalculator
  COUNTRY = ENV.fetch("MUKO_COUNTRY")
  STATE = ENV.fetch("MUKO_STATE")
  CITY = ENV.fetch("MUKO_CITY")
  ZIPCODE = ENV.fetch("MUKO_ZIP")

  def initialize(order)
    @order = order
    @shipment_address = OrderAddress.new(order.place_id)
  end

  def shipping_rates
    package = [ActiveShipping::Package.new(@order.package_weight, @order.package_dimensions)]

    origin = ActiveShipping::Location.new(country: COUNTRY,
                                          state: STATE,
                                          city: CITY,
                                          zip: ZIPCODE)

    destination = ActiveShipping::Location.new(country: @shipment_address.country,
                                               state: @shipment_address.state,
                                               city: @shipment_address.city,
                                               postal_code: @shipment_address.postal_code)

    usps = ActiveShipping::USPS.new(login: ENV.fetch("USPS_DEVELOPER_ID"))
    response = usps.find_rates(origin, destination, package)

    response.rates.sort_by(&:price)
  end
end
