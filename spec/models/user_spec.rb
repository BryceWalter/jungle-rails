require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it 'should save a new User' do
      @user = User.create!({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'happylittletrees@gmail.com',
          password_digest: 'everybodypaints'
        })
      @user.save!
      expect(@user.id).to be_present
    end
    it 'should throw error if first_name is not present' do
      @user = User.create({
          first_name: nil,
          last_name: 'Rossum',
          email: 'happylittletrees@gmail.com',
          password_digest: 'everybodypaints'
        })
      @user.save
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'should throw error if last_name is not present' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: nil,
          email: 'happylittletrees@gmail.com',
          password_digest: 'everybodypaints'
        })
      @user.save
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'should throw error if email is not present' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: nil,
          password_digest: 'everybodypaints'
        })
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'should throw error if password_digest is not present' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'happylittletrees@gmail.com',
          password_digest: nil
        })
      @user.save
      expect(@user.errors.full_messages).to include "Password digest can't be blank"
    end
    it 'should throw error if email is not unique non-case sensitive' do
      @user1 = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'happylittletrees@gmail.com',
          password_digest: 'everybodypaints'
        })
      @user2 = User.create({
          first_name: 'Johnny',
          last_name: 'Rosso',
          email: 'happYlittletRees@gmail.com',
          password_digest: 'everybodypaints'
        })
      @user1.save!
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should set new instance of user if matched' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'john@boi.com',
          password: '1234'
        })
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).not_to be nil
    end
    it 'should set new instance of user if email contains spaces' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'john@boi.com',
          password: '1234'
        })
      @user.save
      expect(User.authenticate_with_credentials(' john@boi.com', @user.password)).not_to be nil
    end
    it 'should set new instance of user if email contains incorrect text cases' do
      @user = User.create({
          first_name: 'Bobby',
          last_name: 'Rossum',
          email: 'john@boi.com',
          password: '1234'
        })
      @user.save
      expect(User.authenticate_with_credentials('JoHn@bOi.com', @user.password)).not_to be nil
    end
  end


end
