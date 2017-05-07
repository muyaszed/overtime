class Post < ActiveRecord::Base

	enum status: {submitted: 0, approved: 1, rejected: 2}
	belongs_to :user
	validates :date, :rationale, presence: true

	scope :post_by, ->(user) {where(user_id: user.id)}
end
