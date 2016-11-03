require 'rails_helper'

describe 'admin panel' do
	

	it "can be reached by admin user" do
		user = FactoryGirl.create(:admin_user)
		login_as(user, :scope => :user)
		visit admin_root_path
		expect(current_path).to eq(admin_root_path)  
	end

	it "can't be reached by non admin user" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		visit admin_root_path
		expect(current_path).to eq(root_path)  

	end 

end