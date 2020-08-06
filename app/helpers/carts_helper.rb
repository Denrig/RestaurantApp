module CartsHelper
  def products(cart)
    cart.products_carts.products
  end
end
