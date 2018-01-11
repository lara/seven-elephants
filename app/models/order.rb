class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  scope :placed, -> { where.not(placed_at: nil) }
  scope :shipped, -> { where.not(shipped_at: nil) }
  scope :cancelled, -> { where.not(cancelled_at: nil) }
  scope :cart, -> { where(placed_at: nil) }

  alias_attribute :placed?, :placed_at?
  alias_attribute :shipped?, :shipped_at?
  alias_attribute :cancelled?, :cancelled_at?

  validates :customer_name, presence: true, if: :placed?, length: { maximum: 22 }
  validates :customer_phone_number, presence: true, if: :placed?, format: /\d+/
  validates :place_id, presence: true, if: :placed?
  validates :address, presence: true, if: :placed?

  def total
  before_update :set_address
    order_products.sum("price * quantity")
  end

  def package_dimensions
    PackageDimensionsCalculator.new(self).package_dimensions || []
  end

  def package_weight
    package_weight = 0
    weights = order_products.joins(:product).pluck(:quantity, :weight)
    weights.each do |order_product|
      package_weight += order_product.first * order_product.second
    end

    package_weight
  end

  def add_order_product(options = {})
    current_item = order_products.find_by(product: options[:product])

    if current_item
      current_item.quantity += options[:quantity].to_i
      current_item.save!
    else
      order_products.create!(
        product: options[:product],
        quantity: options[:quantity],
        price: options[:product].price,
      )
    end
  end

  def number_of_items
    order_products.sum(:quantity)
  end

  def quantity_for_product(product)
    order_products.find_by(product: product)&.quantity || 0
  end

  def status
    return :cancelled if cancelled?
    return :shipped if shipped?
    return :placed if placed?
  end

  private

  def set_address
    return unless place_id?

    client = GooglePlaces::Client.new(ENV.fetch("GOOGLE_API_KEY"))
    spot = client.spot(place_id)
    self.address = spot.formatted_address
  end
end
