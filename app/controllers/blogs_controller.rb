class BlogsController < ApplicationController

	def index
		# @blogs = Blog.all
		@user = User.find( session[:user_id] )
	end
end
