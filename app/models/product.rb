class Product < ApplicationRecord
  has_one_attached :image

  has_many :products_carts, dependent: :destroy
  has_many :carts, through: :products_carts

  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders

  validates :title, :price, :category, :image, presence: true
  validates :title, format: { with: /\A[a-zA-Z ]+\z/,
                              message: 'Title must only contain letters' },
                    length: { minimum: 2, maximum: 20 }
  validates :price, numericality: { only_integer: true }
  validates :category, length: { maximum: 20 }
end
