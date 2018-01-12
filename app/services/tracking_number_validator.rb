class TrackingNumberValidator
  USPS_DEVELOPER_ID = ENV.fetch("USPS_DEVELOPER_ID")

  def initialize(tracking_number)
    @tracking_number = tracking_number
  end

  def check
    usps.find_tracking_info(@tracking_number)
  rescue ActiveShipping::ResponseError
    false
  end

  private

  def usps
    ActiveShipping::USPS.new(login: USPS_DEVELOPER_ID)
  end
end
