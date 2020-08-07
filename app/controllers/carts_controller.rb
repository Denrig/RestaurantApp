class CartsController < ApplicationController
  def show
    @products_carts=Cart.find_by(id: params[:id]).products_carts
  end
  def add
    product_cart=ProductsCart.new(product: Product.find_by(id:params[:product]), cart: current_user.cart, quantity: 1)
    if product_cart.save
    else
      flash[:danger]="Something went wrong while adding to cart"
    end
    redirect_to products_url
  end
end
