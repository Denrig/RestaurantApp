RSpec.describe UsersController, type: :request do
  before do
    @user = { name: 'TestNameToday', email: 'test@email.com', password: 'admin1', password_confirmation: 'admin1' }
  end

  it 'Sign up page' do
    get signup_url
    expect(response).to have_http_status(:success)
  end

  it 'Succesful sign up' do
    post users_url, params: {
      user: @user
    }
    expect(response).to have_http_status(:redirect)
  end

  it 'Failed sign up' do
    @user[:password_confirmation] = 'admin'
    post users_url, params: {
      user: @user
    }
    expect(response).to have_http_status(:success)
    expect(flash.empty?).to be false
  end
end
