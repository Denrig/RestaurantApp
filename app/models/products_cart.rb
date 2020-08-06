class ProductsCart < ApplicationRecord
  belongs_to :cart
  bleongs_to :product
end
