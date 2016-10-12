class Post < ActiveRecord::Base
	belongs_to :user
	validates :date, :rationale, presence: true
end
