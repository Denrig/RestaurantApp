class CartsController < ApplicationController
  def show
    @products_carts = Cart.find_by(id: params[:id]).products_carts
  end

  def add
    product = Product.find_by(id: params[:product])
    cart = current_user.cart
    product_cart = ProductsCart.find_by(product: product, cart: cart)
    # If the product it's not in the cart add it else increment its quantity
    if product_cart.nil?
      product_cart = ProductsCart.new(product: product, cart: cart, quantity: 1)
      flash[:danger] = 'Something went wrong while adding to cart' unless product_cart.save
    else
      product_cart.update(quantity: product_cart.quantity + 1)
    end
  end
end
