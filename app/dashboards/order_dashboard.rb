require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    order_products: Field::HasMany,
    products: Field::HasMany,
    id: Field::Number,
    email: Field::String.with_options(searchable: false),
    address: Field::Text,
    placed_at: Field::DateTime.with_options(
      format: "%m/%d/%y at %T",
    ),
    shipped_at: Field::DateTime.with_options(
      format: "%m/%d/%y at %T",
    ),
    cancelled_at: Field::DateTime.with_options(
      format: "%m/%d/%y at %T",
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: OrderStatusField,
    customer_name: Field::Text,
    customer_phone_number: PhoneNumberField,
    shipping_method: Field::Text,
    shipping_cost: PriceField,
    tracking_number: Field::Text,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    status
    email
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    order_products
    id
    customer_name
    email
    address
    customer_phone_number
    shipping_method
    shipping_cost
    tracking_number
    placed_at
    shipped_at
    cancelled_at
  ].freeze
end
