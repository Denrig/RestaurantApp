require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Atributes validations' do
    before do
      @user = User.new(name: 'This dude', email: 'thisdude@mail.com')
    end
    it 'Validating user instance' do
      expect(@user.valid?).to eq(true)
    end

    it 'Check to short name' do
      @user.name = 'Short'
      expect(@user.valid?).to eq(false)
    end
    it 'Check to long name' do
      @user.name = 'a' * 53
      expect(@user.valid?).to eq(false)
    end
    it 'Check wrong email format' do
      @user.email = 'thisdude@mail,com'
      expect(@user.valid?).to eq(false)
    end
    it 'Check wrong email length' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user.valid?).to eq(false)
    end
    it 'Duplicate email' do
      duplicate_user=@user.dup
      @user.save
      expect(duplicate_user.valid?).to eq false
    end
  end
  context 'Database operations' do
    before do
      @user = User.new(name: 'This dude', email: 'thisdude@mail.com')
    end
    it 'Saving user' do
      expect(@user.save).to eq(true)
    end
    it 'Updating user' do
      @user.update(name: 'That dude')
      expect(@user.name).to eq('That dude')
    end
  end
end
