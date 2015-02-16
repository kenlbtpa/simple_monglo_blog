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

			accepted_formats = ["image/jpg", "image/png" , "image/jpeg" ]
			if !accepted_formats.include? image_io.content_type
				render json:[ status: false, error: "Only jpg and png files are accepted." ] and return
			end			

			image_bytes = image_io.size #bytes
			if image_bytes >= 10000000
				render json:[ status: false, error: "Images can be at-most 10mb." ] and return
			end

			require 'digest/sha1'

			image_name = "#{@user._id}-#{image_io.path}-#{File.basename( image_io.path)}-#{Time.now}"

			hash_name = Digest::SHA1.hexdigest(image_name)

  			image_directory = "blogImages/#{hash_name}#{File.extname( image_io.path)}"

			# Normally this goes to a cdn. Since this is a demo project, we'll store it on the local server. 
			File.open( image_directory , 'wb' ){ |f| f.write( image_io.read ) }

			@blog = Blog.new( title: params[:title] , content: params[:content] , blogger: @user._id , image: image_directory )
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
