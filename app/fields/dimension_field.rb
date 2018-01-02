require "administrate/field/base"

class DimensionField < Administrate::Field::Base
  delegate :length, :width, :height, to: :resource
end
