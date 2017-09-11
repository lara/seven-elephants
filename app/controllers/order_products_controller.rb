class OrderProductsController < ApplicationController
  def create
    OrderProduct.create(order_product_params)
  end

  def update; end

  def destroy; end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity, :product_id, :price)
  end
end
