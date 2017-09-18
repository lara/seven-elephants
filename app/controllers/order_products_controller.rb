class OrderProductsController < ApplicationController
  def create
    @product = Product.find(create_order_product_params[:product_id])
    @order.add_order_product(quantity: create_order_product_params[:quantity], product: @product)
    flash[:success] = "Added to cart!"
    redirect_to product_path(@product)
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "This item doesn't have any left in stock."
    redirect_to product_path(@product)
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(update_order_product_params)

    render js: "window.location.reload()"
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to cart_path
  end

  private

  def create_order_product_params
    params.require(:order_product).permit(:quantity, :product_id)
  end

  def update_order_product_params
    params.require(:order_product).permit(:quantity)
  end
end
