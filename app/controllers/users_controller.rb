class UsersController < ApplicationController

	skip_before_action :verify_authenticity_token
	def index
		render json: User.all
	end
	
	def register
		user = User.new(user_params)
		if user.save
			render json: user.to_json(only: [:token]),status: 200
		else
				render json: user.errors.full_messages ,status: 401 	
		end
	end
	
	def login
		user = User.find_by(username: params[:username] )
		if user.present? && user.valid_password?(params[:password])
			render json: {token: user.token} , status:200
		else
			render json: user.errors.full_messages
		end
	end	

	def logout
		if user.remove_token
			render status:200
		else
			render json: user.errors.full_messages
		end
	end
	def show
		user = User.find_by(id: params[:id])
		if user
			render json: user.to_json(include: [:boards]) 
		else
			render json: "Usuario no encontrado"
		end	
	end

	def destroy
	end

	def edit
	end

	private
	def user_params
		params.require(:user).permit(:username,:name,:password)
	end


end
