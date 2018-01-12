class ShippingRatesCalculator
  class PackageTooHeavyError < StandardError; end

  COUNTRY = ENV.fetch("MUKO_COUNTRY")
  STATE = ENV.fetch("MUKO_STATE")
  CITY = ENV.fetch("MUKO_CITY")
  ZIPCODE = ENV.fetch("MUKO_ZIP")
  USPS_DEVELOPER_ID = ENV.fetch("USPS_DEVELOPER_ID")

  def initialize(order)
    @order = order
    @shipment_address = OrderAddress.new(order.place_id)
  end

  def shipping_rates
    combined_rates = []

    if @order.package_weight < 368
      combined_rates += first_class_parcel_response.rates
    end
    if @order.package_weight < 31751
      combined_rates += priority_response.rates
      combined_rates += express_response.rates
    else
      raise PackageTooHeavyError
    end
    combined_rates.sort_by(&:price)
  end

  private

  def first_class_parcel_response
    usps_rates_for_service(
      service: :first_class,
      first_class_mail_type: :parcel,
    )
  end

  def priority_response
    usps_rates_for_service(service: :priority)
  end

  def express_response
    usps_rates_for_service(service: :express)
  end

  def usps_rates_for_service(service:, first_class_mail_type: nil)
    usps.find_rates(
      origin,
      destination,
      package,
      service: service,
      first_class_mail_type: first_class_mail_type,
    )
  end

  def usps
    ActiveShipping::USPS.new(login: USPS_DEVELOPER_ID)
  end

  def package
    [ActiveShipping::Package.new(@order.package_weight, @order.package_dimensions)]
  end

  def origin
    ActiveShipping::Location.new(
      country: COUNTRY,
      state: STATE,
      city: CITY,
      zip: ZIPCODE,
    )
  end

  def destination
    ActiveShipping::Location.new(
      country: @shipment_address.country,
      state: @shipment_address.state,
      city: @shipment_address.city,
      postal_code: @shipment_address.postal_code,
    )
  end
end
