class Order < ApplicationRecord
  before_create :create_one_time_token

  belongs_to :user
  has_many :product_orders

  validates :address, :phone, :city, presence: true
  validates :address, length: { maximum: 50 }

  enum city: { 'Baia Mare': 0, 'Cluj-Napoca': 1 }
  enum status: %i[waiting accepted rejected]

  def total
    total = 0
    product_orders.each { |product_order| total += product_order.price * product_order.quantity }
    total
  end

  def create_one_time_token
    self.one_time_token = User.new_token
  end
end
