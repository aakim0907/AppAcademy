require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      name: "Zach", password: "password")
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:password_digest) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }

    it "user must have a session token" do
      user = FactoryGirl.build(:user)
      expect(user.session_token).to be_present
    end
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe 'class method' do
    describe '::find_by_credentials' do
      it "should check for the name and password" do
        expect(User.find_by_credentials("Zach", "notapassword")).to eq(nil)
      end

      it "should return the correct user" do
        user.valid?
        expect(User.find_by_credentials("Zach", "password")).to eq(user)
      end
    end
  end

  describe 'instance method' do
    describe '#password=' do
      it "should create password digest from password" do
        expect(user.password_digest).to_not eq(nil)
      end
    end

    describe '#reset_session_token!' do
      it "sets a new session token on the user" do
        old = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old)
      end

      it "returns the new session token" do
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

    describe '#is_password?' do
      it "verfies a password is correct" do
        expect(user.is_password?("password")).to be true
      end

      it "verifies a password is not correct" do
        expect(user.is_password?("notapassword")).to be false
      end
    end
  end
end
