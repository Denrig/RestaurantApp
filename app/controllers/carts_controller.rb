class CartsController < ApplicationController
  def show
    @products_carts = current_user.cart.products_carts
    @total_price = @products_carts.map { |element| element.product.price * element.quantity }.sum
  end

  def add
    product = Product.find_by(id: params[:product])
    cart = current_user.cart
    product_cart = ProductsCart.find_by(product: product, cart: cart)
    # If the product it's not in the cart add it else increment its quantity
    if product_cart.nil?
      product_cart = ProductsCart.new(product: product, cart: cart, quantity: 1)
      if product_cart.save
        flash.now[:success] = 'Added to cart'
      else
        flash.now[:danger] = 'Something went wrong while adding to cart'
      end
    else
      product_cart.update(quantity: product_cart.quantity + 1)
      flash.now[:success] = 'Added to cart'
    end
    redirect_to products_url
  end
end
