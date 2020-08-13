class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product=@products.first
  end
end
