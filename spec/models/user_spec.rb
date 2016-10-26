require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "yazed", last_name: "jamal")
    end
  describe "creation" do
  	

  	it "can be created" do
  		
  		expect(@user).to be_valid
  	end

  	it "cannot be created without first name" do
  		@user.first_name = nil
  		

  		expect(@user).to_not be_valid
  	end

  	it "cannot be created without last name" do
  		
  		@user.last_name = nil

  		expect(@user).to_not be_valid
  	end
 
  end

  describe "custom full name method" do
    it "combines first name and last name" do
      expect(@user.full_name).to eq("yazed jamal")
    end
  end
end
