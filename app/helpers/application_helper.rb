module ApplicationHelper

	def active(path)
		"active" if current_page?(path)

	end

	def account_menu
	  if user_signed_in?
	  		"login"
	  else
	  		"logout"
	  end
	end

end
