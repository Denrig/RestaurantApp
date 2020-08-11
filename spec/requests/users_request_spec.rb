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
      expect(flash.empty?).to be false
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
      @user = User.first
    end

    it 'Failed edit' do
      @user_hash[:name] = ''
      patch "/users/#{@user.id}", params: { user: @user_hash }
      expect(@user.name).to eq('TestNameToday')
      expect(response).to have_http_status(:success)
    end

    it 'Succesful edit' do
      @user_hash[:name] = 'TestNameTomorrow'
      patch "/users/#{@user.id}", params: { user:
        @user_hash }
      @user.reload
      expect(@user.name).to eq('TestNameTomorrow')
      expect(response).to have_http_status(:redirect)
      expect(flash.empty?).to be false
    end

    it 'Edit other user beside yourself' do
      @user_hash[:email] = 'alin@alin.alin'
      post users_url params: {
        user: @user_hash
      }

      @user_hash[:name] = 'TestNameTomorrow'
      patch "/users/#{@user.id}", params: { user: @user_hash }
      @user.reload
      expect(@user.name).to eq('TestNameToday')
      expect(response).to have_http_status(:redirect)
    end
  end
end
