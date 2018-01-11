class ChargesController < ApplicationController
  def new; end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken],
    )
    @client = GooglePlaces::Client.new(ENV.fetch("GOOGLE_API_KEY")).spot(params[:place_id])

    @order.update!(
      customer_name: params[:customer_name],
      customer_phone_number: params[:customer_phone_number],
      email: customer.email,
      placed_at: Time.now,
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @order.total,
      currency: "usd",
    )

    @order.order_products.each do |order_product|
      order_product.product.stock_quantity -= order_product.quantity
      order_product.product.save
    end

    OrderMailer.order_placed_email(@order).deliver_now
    expire_shopping_cart
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
