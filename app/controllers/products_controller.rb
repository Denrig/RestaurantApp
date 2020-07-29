class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)

    redirect_to products_url if product.save
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :category, :image)
  end
end
