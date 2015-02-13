class UsersController < ApplicationController

	def index
	end

	def new
		#Login
	end

	def create
		#Register
		if params[:password] != params[:password_confirmation]
			render json: [ status: false , error: "Passwords are not the same." ] and return
		end
		@user = User.new( nickname: params[:nickname] , email: params[:email] , pass: params[:password] )
		@user.save
		render json:[ status: true, message: "Your account has been successfully created" ] and return
	end


end
