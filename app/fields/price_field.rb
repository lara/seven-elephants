require "administrate/field/base"

class PriceField < Administrate::Field::Base
  def format_price
    data * 0.01
  end
end
