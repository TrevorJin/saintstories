require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryBot.build(:user) }

  describe 'name' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(50) }

    context 'a user with a valid name' do
      let(:valid_name) { 'Pier Giorgio Frassati' }
      before do
        user.name = valid_name
      end

      it 'is valid' do
        expect(user).to be_valid
      end

      it 'may be stored in the database' do
        expect(user.save).to be_truthy
      end
    end

    context 'a user with an overly long name (> 50 chars)' do
      before do
        user.name = 'a' * 51
      end

      it 'is invalid' do
        expect(user).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(user.save).to be_falsey
      end
    end
  end

  describe 'email' do
    it { should validate_presence_of :email }
    it { should validate_length_of(:email).is_at_most(255) }

    context 'a user with a valid email' do
      let(:valid_addresses) { %w(user@example.com USER@foo.COM
                            A_US-ER@foo.bar.org first.last@foo.jp
                            alice+bob@baz.cn) }
    
      it 'is valid' do
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end

      it 'may be stored in the database' do
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user.save).to be_truthy
        end
      end
    end

    context 'a user with an overly long email (> 255 chars)' do
      before do
        user.email = 'a' * 256
      end

      it 'is invalid' do
        expect(user).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(user.save).to be_falsey
      end
    end

    context 'a user with an invalid email' do
      let(:invalid_addresses) { %w(user@example,com
                              user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com) }

      it 'is invalid' do
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end

      it 'may not be stored in the database' do
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user.save).to be_falsey
        end
      end
    end
  end

  describe 'password' do
    it { should have_secure_password }
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6) }

    context 'a user with a valid password' do
      let(:valid_password) { 'padrepioisgreat' }
      before do
        user.password = valid_password
        user.password_confirmation = valid_password
      end

      it 'is valid' do
        expect(user).to be_valid
      end

      it 'may be stored in the database' do
        expect(user.save).to be_truthy
      end
    end

    context 'a user with an overly short password (< 6 chars)' do
      before do
        user.password = 'a' * 5
        user.password_confirmation = 'a' * 5
      end

      it 'is invalid' do
        expect(user).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(user.save).to be_falsey
      end
    end
  end

  describe 'admin' do
    it { expect(user.admin).to be_falsey }
  end

  describe 'activated' do
    it { expect(user.activated).to be_falsey }
  end

  describe 'approved' do
    it { expect(user.approved).to be_falsey }
  end

  describe 'active' do
    it { expect(user.active).to be_truthy }
  end

  describe '#digest' do
    it { expect(User.digest('Filler123')).to be_truthy }
  end

  describe '#new_token' do
    it { expect(User.new_token).to be_truthy }
  end

  describe '#authenticated?' do
    
    context 'nil digest' do
      it { expect(user.authenticated?(:remember, '')).to be_falsey }
    end
  end

  describe '#forget' do
    let (:remembered_user) { FactoryBot.build(:remembered_user) }

    it 'forgets user' do
      expect(remembered_user.remember_digest).to be_truthy
      remembered_user.forget
      expect(remembered_user.remember_digest).to be_falsey
    end
  end

  describe '#activate' do
    
    it 'activates user' do
      expect(user.activated).to be_falsey
      expect(user.activated_at).to be_falsey
      user.activate
      expect(user.activated).to be_truthy
      expect(user.activated_at).to be_truthy
    end
  end

  describe '#create_reset_digest' do

    it 'sets password reset attributes' do
      expect(user.reset_digest).to be_falsey
      expect(user.reset_sent_at).to be_falsey
      user.create_reset_digest
      expect(user.reset_digest).to be_truthy
      expect(user.reset_sent_at).to be_truthy
    end
  end

  describe '#password_reset_expired?' do

    context 'password reset sent too long ago (>= 2 hours)' do

      it 'is expired' do
        user.reset_sent_at = 3.hours.ago
        expect(user.password_reset_expired?).to be_truthy
      end
    end

    context 'password reset sent not too long ago (< 2 hours)' do

      it 'is not expired' do
        user.reset_sent_at = Time.zone.now
        expect(user.password_reset_expired?).to be_falsey
      end
    end
  end

  describe '#approve_user_account' do
    
    it 'approves user' do
      expect(user.approved).to be_falsey
      expect(user.approved_at).to be_falsey
      user.approve_user_account
      expect(user.approved).to be_truthy
      expect(user.approved_at).to be_truthy
    end
  end

  describe '#deactivate_user' do

    it 'deactivates user' do
      expect(user.active).to be_truthy
      user.deactivate_user
      expect(user.active).to be_falsey
    end
  end

  describe '#reactivate_user' do
    let (:inactive_user) { FactoryBot.build(:inactive_user) }

    it 'reactivates user' do
      expect(inactive_user.active).to be_falsey
      inactive_user.reactivate_user
      expect(inactive_user.active).to be_truthy
    end
  end

  describe '#change_to_admin' do
    
    it 'changes regular user to an admin' do
      expect(user.admin).to be_falsey
      user.change_to_admin
      expect(user.admin).to be_truthy
    end
  end

  describe '#change_to_user' do
    let (:admin) { FactoryBot.build(:admin) }

    it 'changes admin to a regular user' do
      expect(admin.admin).to be_truthy
      admin.change_to_user
      expect(admin.admin).to be_falsey
    end
  end
end
