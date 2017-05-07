class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	

	def index
		@posts = current_user.posts
	end

	def new 
		@post = Post.new
	end

	def edit
		
		authorize @post
	end

	def show

		
	end

	def update
		authorize @post
		if @post.update(post_params)
			redirect_to @post, notice: "Your post updated sucessfully"
		else
			render :edit
		end
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

	def destroy
		@post.delete
		redirect_to posts_path, notice: "Your post is deleted"
	end

	private

	def post_params
		params.require(:post).permit(:date, :rationale, :status)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
