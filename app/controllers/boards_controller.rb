class BoardsController < ApplicationController

	skip_before_action :verify_authenticity_token
	
	def create
		board = Board.new

		#Si los jugadores estan logeados, los agrega al board
		#Caso contrario, crea el tablero sin jugadores
		if (params[:player_x].present? && params[:player_x].present? )
			player_x = User.find_by(id: params[:player_x])
			player_o = User.find_by(id: params[:player_o])
			if (player_x.present? && player_o.present?)
				board.users << player_x 
				board.users << player_o
		end
		

		if board.save
			render json: board.to_json(include: {users: { only: :username}}, except: [:created_at, :updated_at])
		else
			render json: board.errors.full_messages
		end
	end

	def move
		board = Board.find_by(id:params[:id])
	
		if board.present? && board.finished == false
			if board[params[:square]].blank?
				board[params[:square]] = params[:player]
				board.finished = board.check_win(params[:player])
				
				render json: board if board.save
			else
				render json: "Casillero ocupado"
			end
		
		else
			render json: "Tablero no encontrado o terminado"
		end
	end

	def index
		render json: Board.all
	end

	def show
		board = Board.find_by(id: params[:id])
		if(board.present?)
			render json: board
		else	
			render json: "Tablero no encontrado"
		end
	end


	private
	def board_params
		params.require(:board).permit(:square00,:square01,:square02,:square10,:square11,:square12,:square20,:square21,:square22,:id,:finished)
	end

end
