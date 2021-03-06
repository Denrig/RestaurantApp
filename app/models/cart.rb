class Cart < ApplicationRecord
  belongs_to :user
  has_many :products_carts, dependent: :destroy
  has_many :products, through: :products_carts

  def clear!
    products_carts.destroy_all
  end
end
