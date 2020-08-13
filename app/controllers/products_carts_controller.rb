class ProductsCartsController < ApplicationController
  def create
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
  end

  def destroy
    product_cart = ProductsCart.find_by(id: params[:id])
    if product_cart.destroy
      flash[:success] = 'Product removed from cart'
      redirect_to product_cart.cart
    else
      flash[:danger] = 'Something went wrong while removing from cart'
    end
  end

  def change_quantity
    action = params[:operation]
    product_cart = ProductsCart.find_by(id: params[:id])
    case action
    when 'sub'
      product_cart.quantity -= 1
    when 'add'
      product_cart.quantity += 1
    end

    product_cart.quantity.zero? ? product_cart.destroy : product_cart.save
    redirect_to product_cart.cart
  end
end
