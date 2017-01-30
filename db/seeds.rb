user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Yazed", last_name: "jamal")
admin_user = AdminUser.create(email: "admin@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Admin", last_name: "User")
100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rational content", user_id: user.id)
end