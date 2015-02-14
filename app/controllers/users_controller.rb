class UsersController < ApplicationController

	def index
	end

	def new
		#Login
		@user = User.first( email: params[:email] )
		if @user === nil
			render json: [ status: false , error: "Invalid username or password" ] and return 
		elsif @user.pass === BCrypt::Engine.hash_secret( params[:password] , @user.pass_salt )
			# Login Success
			session[:user_id] = @user._id
			render json:[ status: true , message: "Your are now logged in." ] and return
		else
			render json: [ status: false , error: "Invalid username or password" ] and return
		end
	end

	def create
		#Register
		if params[:password] != params[:password_confirmation]
			render json: [ status: false , error: "Passwords are not the same." ] and return
		end
		@user = User.new( nickname: params[:nickname] , email: params[:email] , pass: params[:password] )
		if !@user.save
			render json:[ status: false, error: @user.errors.full_messages ] and return
		end
		render json:[ status: true, message: "Your account has been successfully created" ] and return
	end


end
