class Post < ActiveRecord::Base
	validates :date, :rationale, presence: true
end
