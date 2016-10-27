FactoryGirl.define do

	factory :user do
		first_name "yazed"
		last_name "jamal"
		email "test@test.com"
		password "123456"
		password_confirmation "123456"
	end

	factory :admin_user, class: "AdminUser" do
		first_name "admin"
		last_name "user"
		email "admin@test.com"
		password "123456"
		password_confirmation "123456"
	end
end

