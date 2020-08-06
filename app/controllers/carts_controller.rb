class CartsController < ApplicationController
  def show
    @products=Cart.find_by(id: params[:id]).products
  end
  def add
    ProductsCart.create(product: params[:product], cart: current_user.cart, quantity: 1)
    redirect_to root_url
  end
end
