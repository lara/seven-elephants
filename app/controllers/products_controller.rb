class ProductsController < ApplicationController
  def index
    if params[:search_term]
      @products = Product.search(params[:search_term]).order(created_at: :asc)
    else
      @products = Product.all.order(created_at: :asc)
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new(product: @product)
  end
end
