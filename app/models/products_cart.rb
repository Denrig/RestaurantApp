class ProductsCart < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :between_cart_product, ->(cart,product) { where('cart_id = ? and product_id=?', cart.id,product.id).first }
end
