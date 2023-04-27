require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.create(:user)
    end
  
    describe 'New user registration' do
      context 'When new registration is successful' do

        it 'User is valid.' do
          expect(@user).to be_valid
        end

        it 'You can register if your password is 6 characters or more' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
      end

      context 'When new registration does not go well' do

        it 'Cannot register if email is empty' do
          @user.email = nil
          expect(@user).not_to be_valid
        end

        it 'Cannot register if there are duplicate emails' do
          @user.save
          expect{another_user = FactoryBot.create(:user, email: @user.email)}.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'Cannot register if password is empty' do
          @user.password = nil
          expect(@user).not_to be_valid
        end

        it 'password even if password exists_confirmation cannot be registered if it is empty' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'Cannot register if password is 5 characters or less' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

      end
    end
  end
end