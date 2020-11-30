require 'rails_helper'

RSpec.describe AccountMailer, type: :mailer do
  describe 'activation' do
    let(:mail) { AccountMailer.activation(User.create(name: 'This dude', email: 'thisdude@mail.com', password: 'password', password_confirmation: 'password')) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Activation')
      expect(mail.to).to eq(['thisdude@mail.com'])
      expect(mail.from).to eq(['noreply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
