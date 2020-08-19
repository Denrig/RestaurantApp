require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'Sign up user feature' do
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
    end
  end

  context 'Edit user feature' do
    before do
      @user_hash = {
        name: 'TestNameToday',
        email: 'test@email.com',
        password: 'admin1',
        password_confirmation: 'admin1'
      }
      post users_url, params: {
        user: @user_hash
      }
      User.first.toggle!(:activated)
      post login_path, params: { session: { email: 'test@email.com', password: 'admin1', remember_me: '0' } }

      @user = User.first
    end

    it 'Failed edit' do
      @user_hash[:name] = ''
      patch user_url(@user), params: { user: @user_hash }
      expect(@user.name).to eq('TestNameToday')
    end

    it 'Succesful edit' do
      @user_hash[:name] = 'TestNameTomorrow'
      patch user_url(@user), params: { user:
        @user_hash }
      @user.reload
      expect(@user.name).to eq('TestNameTomorrow')
    end

    it 'Edit other user beside yourself' do
      @user_hash[:email] = 'alin@alin.alin'
      post users_url params: {
        user: @user_hash
      }
      User.find_by(email: 'alin@alin.alin').toggle!(:activated)
      @user_hash[:name] = 'TestNameTomorrow'
      patch user_url(@user), params: { user: @user_hash }
      @user.reload
      expect(@user.name).to eq('TestNameToday')
    end
  end
end
