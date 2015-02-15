class BlogsController < ApplicationController

	def index
		# @blogs = Blog.all
		@blogs = Blog.all
		@user = User.find( session[:user_id] )
	end

	def create

		@user = User.find( session[:user_id] )

		begin
			if @user.nil? 
				render json: [ status: false , error: "Your are not logged in." ] and return 
			end 

			@blog = Blog.new( title: params[:title] , content: params[:content] , blogger: @user._id )
			if @blog.save(safe: true)
				render json:[ status: true, message: "Your blog has been created" ]
			else
				render json:[ status: false, error: @user.errors.full_messages ] and return
			end
		rescue => e
			render json:[ status: false, error: e.message ] and return
		end


	end
end
