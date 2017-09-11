class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new(product: @product)
  end
end
