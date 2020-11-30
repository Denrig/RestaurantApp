class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :price, presence: true, numericality: { only_integer: true }
end
