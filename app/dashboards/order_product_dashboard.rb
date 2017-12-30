require "administrate/base_dashboard"

class OrderProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    product: Field::BelongsTo,
    order: Field::BelongsTo,
    id: Field::Number,
    quantity: Field::Number,
    price: PriceField,
    total: PriceField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    product
    quantity
    price
    total
  ].freeze
end
