class OrderProductsController < ApplicationController
  def create
    @product = Product.find(order_product_params[:product_id])
    @order.add_order_product(quantity: order_product_params[:quantity], product: @product)
    flash[:success] = "Added to cart!"
    redirect_to product_path(@product)
  end

  def update; end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to cart_path
  end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity, :product_id)
  end
end
