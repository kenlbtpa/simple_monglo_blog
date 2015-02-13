class UsersController < ApplicationController

	def index
	end

	def new
		#Login
	end

	def create
		#Register
		render json: params
	end


end
