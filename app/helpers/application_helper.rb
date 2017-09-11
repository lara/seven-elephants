module ApplicationHelper
  def format_price(price_in_cents)
    number_to_currency(price_in_cents * 0.01)
  end
end
