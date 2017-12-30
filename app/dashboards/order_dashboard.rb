require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    products
    email
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    products
    id
    email
    address
    placed_at
    shipped_at
    cancelled_at
    created_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    order_products
    products
    email
    address
    placed_at
    shipped_at
    cancelled_at
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
