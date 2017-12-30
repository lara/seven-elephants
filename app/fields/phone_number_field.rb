require "administrate/field/base"

class PhoneNumberField < Administrate::Field::Base
  include ActionView::Helpers::NumberHelper
  def customize
    number_to_phone(data, delimiter: "-")
  end
end
