require 'rails_helper'

RSpec.describe "Bases", type: :request do
  before do
    @admin = User.create(
      name: 'This dude',
      email: 'admin@mail.com',
      password: 'password',
      password_confirmation: 'password',
      cart: Cart.new,
      activated: true,
      admin: true
    )
    @user = User.create(
      name: 'This dude',
      email: 'thisdude@mail.com',
      password: 'password',
      password_confirmation: 'password',
      cart: Cart.new,
      activated: true
    )
  end
  
  it 'User tries to get admin page' do
    post login_path, params: { session: { email: 'thisdude@mail.com', password: 'password', remember_me: '0' } }
    get admin_root_url
    expect(response).to have_http_status(:redirect)
  end
  
  it 'Admin tries to get admin page' do
    post login_path, params: { session: { email: 'admin@mail.com', password: 'password', remember_me: '0' } }
    get admin_root_url
    expect(response).to have_http_status(:success)
  end
end
