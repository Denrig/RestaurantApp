require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET login' do
    it 'returns http success' do
      get login_path
      expect(response).to have_http_status(:success)
    end
    it 'login with invalid information' do
      get login_path
      expect(response).to have_http_status(:success)
      post login_path, params: { session: { email: '', password: '' } }
      expect(response).to have_http_status(:success)
      expect(flash.empty?).to be false
      get root_path
      expect(flash.empty?).to be true 
    end
  end
end
