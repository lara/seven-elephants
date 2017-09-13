class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_shopping_cart

  private

  def set_shopping_cart
    @order = Order.find_by(id: session[:order_id]) || Order.create
    session[:order_id] = @order.id
  end
end
