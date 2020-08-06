class Product < ApplicationRecord
  has_one_attached :image
  has_many :products_carts

  validates :title, :price, :category, :image, presence: true
  validates :title, format: { with: /\A[a-zA-Z ]+\z/,
                              message: 'Title must only contain letters' },
                    length: { minimum: 2, maximum: 20 }
  validates :price, numericality: { only_integer: true }
  validates :category, length: { maximum: 20 }
end
