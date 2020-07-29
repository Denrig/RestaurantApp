class Product < ApplicationRecord
  has_one_attached :image

  validates :title, :price, :description, :image, presence: true
  validates :title, format: { with: /\A[a-zA-Z]+\z/,
                              message: 'Title must only contain letters' }
  validates :price, numericality: { only_integer: true }
  validates :description, length: { maximum: 140 }
end
