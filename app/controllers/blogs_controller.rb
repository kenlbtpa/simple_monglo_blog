class BlogsController < ApplicationController

	def index
		# @blogs = Blog.all
		@blogs = [1,2,3,4,5,6]
		@user = User.find( session[:user_id] )
	end
end
