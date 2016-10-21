class PostsController < ApplicationController
	before_action :find_post, only: [:show]
	before_action :authenticate_user!, only: [:new, :show]

	def index

	end

	def new 
		@post = Post.new
	end

	def show

		
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post, notice: 'Your post created successfully'
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:date, :rationale)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
