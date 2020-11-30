require 'rails_helper'

RSpec.describe CartsController, type: :request do
  before do
    @user = User.create(name: 'This dude', email: 'thisdude@mail.com', password: 'password', password_confirmation: 'password', cart: Cart.new)
    @product = Product.new(title: 'Test', category: 'Test', price: 123)
    @product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'dish.png')), filename: 'dish.png')
    delete logout_url
  end

  it 'Add to cart before login' do
    post products_carts_url, params: { porduct: @product }
    expect(@user.cart.products.count).to be 0
  end

  it 'Add to cart after login' do
    post login_path, params: { session: { email: 'thisdude@mail.com', password: 'password' } }
    expect(response).to have_http_status(:redirect)

    post products_carts_url, params: { porduct: @product }
  end
end
