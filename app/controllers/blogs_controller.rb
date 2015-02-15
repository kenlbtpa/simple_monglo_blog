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
			# image = params[:image]

			image_io = params[:image]

			accepted_formats = ["image/jpg", "image/png" ]
			if !accepted_formats.include? image_io.content_type
				render json:[ status: false, error: "Only jpg and png files are accepted." ] and return
			end			

			res = image_io.size
			render json:[ status: false, error: res ] and return


			# p 

			
			# p image['datafile']
			# p '\r\n'
			# p File.extname( image['datafile'] )
			# p '\r\n'
			# p File.size( image['datafile'] )			



			# if File.size( image['datafile'] )
			# 	render json:[ status: false, error: "Only jpg and png files are accepted." ] and return
			# end

			render json:[ status: false, error: "Checking stuff" ] and return

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
