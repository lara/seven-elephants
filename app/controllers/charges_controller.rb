class ChargesController < ApplicationController
  def new; end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
    @order.order_products.each do |order_product|
      order_product.product.stock_quantity -= order_product.quantity
      order_product.product.save
    end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
    @order.update(placed_at: Time.now)
    expire_shopping_cart
end
