class BlogsController < ApplicationController

	def index
		@blogs = Blogs.all
	end
end
