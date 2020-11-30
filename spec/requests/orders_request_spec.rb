require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  before do
    @user = User.create(
      name: 'This dude',
      email: 'thisdude@mail.com',
      password: 'password',
      password_confirmation: 'password',
      cart: Cart.new,
      activated: true
    )
    @another_user = User.create(
      name: 'This dude',
      email: 'thisdude1@mail.com',
      password: 'password',
      password_confirmation: 'password',
      cart: Cart.new,
      activated: true
    )
    @product = Product.new(title: 'Test', category: 'Test', price: 123)
    @product.image.attach(io: File.open(Rails.root.join('spec', 'images', 'dish.png')), filename: 'dish.png')
    @product.save!
    post login_path, params: { session: { email: 'thisdude@mail.com', password: 'password', remember_me: '0' } }
    post products_carts_url, params: { product: @product.id }
  end

  it 'Check cart not empty' do
    expect(@user.cart.products.count).to be > 0
  end

  it 'Create order' do
    post orders_path, params: { order: { city: 'Baia Mare', address: 'ASDAFA', phone: '1234567890' } }
    expect(@user.cart.products.count).to be 0
    expect(@user.orders.count).to be 1
    expect(@user.orders.first.product_orders.count).to be > 0
  end
  context 'Show context' do
    before do
      post products_carts_url, params: { product: @product.id }
      post orders_path, params: { order: { city: 'Baia Mare', address: 'ASDAFA', phone: '1234567890' } }
    end
    it 'Access your own order' do
      get order_url(@user.orders.first)
      expect(response).to have_http_status(:success)
    end
    it 'Access another`s user order' do
      delete logout_url
      post login_path, params: { session: { email: 'thisdude1@mail.com', password: 'password', remember_me: '0' } }
      get order_url(@user.orders.first)
      expect(response).to have_http_status(:redirect)
    end
  end
end
