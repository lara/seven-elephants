class InquiryMailer < ApplicationMailer
  MUKO_EMAIL = ENV.fetch("MUKO_EMAIL")

  def new_inquiry_email(inquiry)
    @inquiry = inquiry
    mail(
      from: "#{inquiry.name} <#{inquiry.email_address}>",
      subject: "[SEVEN ELEPHANTS] Customer Inquiry",
      to: MUKO_EMAIL,
    )
  end
end
