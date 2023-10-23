require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    before(:all){ User.destroy_all }

    describe "password and password_confirmation fields" do
      it "create a new user when the two fields match" do
        @user = User.new(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass123")
        result = @user.save

        expect(result).to be true
        expect(@user.errors).to be_empty
      end

      it "fail to create a user when the two fields do not match" do
        @user = User.new(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass321")
        result = @user.save

        expect(result).to be false
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "fail when password field is nil" do
        @user = User.new(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password_confirmation:"Pass123")
        result = @user.save

        expect(result).to be false
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "fail when password_confirmation field is nil" do
        @user = User.new(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"Pass123")
        result = @user.save

        expect(result).to be false
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end

    end

    describe "email must be unqiue" do
      before(:all) do
        User.create(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass123")
      end

      it "fail when attempting to create an account with an existing email" do
        @user = User.new(first_name: "Ali", last_name: "Johnson", email: "aj123@email.com", password:"Pass123",  password_confirmation:"Pass123")
        result = @user.save

        expect(result).to be false
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end

      it "fail when attempting to create an account with an existing email in different case (not case sensitive)" do
        @user = User.new(first_name: "Ali", last_name: "Johnson", email: "AJ123@EMAIL.COM", password:"Pass123",  password_confirmation:"Pass123")
        result = @user.save

        expect(result).to be false
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
    end

    it "fail to create user when email is nil" do
      @user = User.new(first_name: "Alice", last_name: "Johnson", password:"Pass123", password_confirmation:"Pass123")
      result = @user.save

      expect(result).to be false
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "fail to create user when first_name is nil" do
      @user = User.new(last_name: "Johnson",email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass123")
      result = @user.save

      expect(result).to be false
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "fail to create user when last_name is nil" do
      @user = User.new(first_name: "Alice", email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass123")
      result = @user.save

      expect(result).to be false
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end   

    it "fail to create user when password's length less than 4" do
      @user = User.new(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"123", password_confirmation:"123")
      result = @user.save

      expect(result).to be false
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
    end   

  end


  describe '.authenticate_with_credentials' do
    before(:all) do
      User.create(first_name: "Alice", last_name: "Johnson", email: "aj123@email.com", password:"Pass123", password_confirmation:"Pass123")
    end

    it "return a user instance when correct email and password is input" do
      @user = User.authenticate_with_credentials("aj123@email.com", "Pass123")

      expect(@user).to be_a User
      expect(@user.first_name).to eq "Alice"
      expect(@user.email).to eq "aj123@email.com"
    end

    it "return nil when incorrect email is input" do
      @user = User.authenticate_with_credentials("wrong@email.com", "Pass123")
      
      expect(@user).not_to be_a User
      expect(@user).to be nil
    end

    it "return nil when incorrect password is input" do
      @user = User.authenticate_with_credentials("aj123@email.com", "Pass")
      
      expect(@user).not_to be_a User
      expect(@user).to be nil
    end

    it "return a user instance when email is input with leading and trailing spaces" do
      @user = User.authenticate_with_credentials(" aj123@email.com  ", "Pass123")
      
      expect(@user).to be_a User
      expect(@user.first_name).to eq "Alice"
      expect(@user.email).to eq "aj123@email.com"
    end

    it "return a user instance when email is input with a wrong case" do
      @user = User.authenticate_with_credentials("AJ123@email.com", "Pass123")
      
      expect(@user).to be_a User
      expect(@user.first_name).to eq "Alice"
      expect(@user.email).to eq "aj123@email.com"
    end

  end
end
