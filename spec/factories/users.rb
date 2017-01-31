FactoryGirl.define do

	sequence :email do |n|
		"test#{n}@test.com"
	end

	factory :user do
		first_name "yazed"
		last_name "jamal"
		email {generate :email}
		password "123456"
		password_confirmation "123456"
	end

	factory :admin_user, class: "AdminUser" do
		first_name "admin"
		last_name "user"
		email {generate :email}
		password "123456"
		password_confirmation "123456"
	end

	factory :non_authorized_user, class: "User" do
		first_name "None"
		last_name "Authorized"
		email {generate :email}
		password "123456"
		password_confirmation "123456"
	end
end

