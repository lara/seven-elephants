class Inquiry
  include ActiveModel::Model

  attr_accessor(
    :name,
    :email_address,
    :content,
  )

  validates :email_address, format: /\S+@\S+/
  validates :name, length: { maximum: 30 }

  def deliver
    if valid?
      InquiryMailer.new_inquiry_email(self).deliver_now
    else
      false
    end
  end
end
