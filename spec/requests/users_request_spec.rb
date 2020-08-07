RSpec.describe UsersController, type: :request do
  context 'Sign Up' do
    it 'Sign up page' do
      get signup_url
      expect(response).to have_http_status(:success)
    end

    it 'Succesful sign up' do
      post users_url, params: { user: { name: 'TestNameToday', email: 'test@email.com', password: 'admin1', password_confirmation: 'admin1' } }
      expect(response).to have_http_status(:redirect)
    end

    it 'Failed sign up' do
      post users_url, params: { user: { name: 'TestNameToday', email: 'test@email.com', password: 'admin1', password_confirmation: 'admin' } }
      expect(response).to have_http_status(:success)
      expect(flash.empty?).to be false
    end
  end
end
