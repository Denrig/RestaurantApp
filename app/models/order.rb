class Order < ApplicationRecord
  belongs_to :user
  serialize :products, Hash

  validates :products, :address, :phone, :city, presence: true
  validates :address, length: { maximum: 50 }

  enum city: { 'Baia Mare': 0, 'Cluj-Napoca': 1 }
end
