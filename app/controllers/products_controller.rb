class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :asc)
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new(product: @product)
  end
end
