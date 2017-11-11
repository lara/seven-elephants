class ProductsController < ApplicationController
  def index
    if params[:search_term]
      @products = Product.search {
        fulltext params[:search_term]
        spellcheck count: 3
      }.results
    else
      @products = Product.all.order(created_at: :asc)
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_product = OrderProduct.new(product: @product)
  end
end
