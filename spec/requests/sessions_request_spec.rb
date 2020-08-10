require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  before do
    post users_url, params: {
      user: { name: 'TestNameToday', email: 'test@email.com', password: 'admin1', password_confirmation: 'admin1' }
    }
    delete logout_url
  end

  it 'Get login page' do
    get login_path
    expect(response).to have_http_status(:success)
  end

  it 'Succesful login' do
    post login_path, params: { session: { email: 'test@email.com', password: 'admin1' } }
    expect(response).to have_http_status(:redirect)
  end

  it 'Login with invalid information' do
    post login_path, params: { session: { email: '', password: '' } }
    expect(response).to have_http_status(:success)
    expect(flash.empty?).to be false
    get root_path
    expect(flash.empty?).to be true
  end
end
