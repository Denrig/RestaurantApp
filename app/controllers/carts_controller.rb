class CartsController < ApplicationController
  def show
    @products_carts = current_user.cart.products_carts
    @total_price = @products_carts.map { |element| element.product.price * element.quantity }.sum
    flash[:info] = 'Seems like your cart is empty' if @products_carts.count.zero?
  end
end
