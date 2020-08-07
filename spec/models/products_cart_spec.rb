require 'rails_helper'

RSpec.describe ProductsCart, type: :model do
  before do
    @product = Product.new(title: 'Test', category: 'Test', price: 123)
    @product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'dish.png')), filename: 'dish.png')
  end
end
