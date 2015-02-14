class BlogsController < ApplicationController

	def index
		# @blogs = Blog.all
		@blogs = [1]
		@user = User.find( session[:user_id] )
	end
end
