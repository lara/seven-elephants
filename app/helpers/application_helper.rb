module ApplicationHelper
  def format_price(price_in_cents)
    number_to_currency(price_in_cents * 0.01)
  end

  def grams_to_pounds(grams)
    (grams * 0.00220462).round(2)
  end

  def pounds_to_grams(pounds)
    (pounds * 453.592).round(2)
  end
end
