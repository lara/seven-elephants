require "administrate/field/base"

class OrderStatusField < Administrate::Field::Base
  def customize
    data.capitalize
  end
end
