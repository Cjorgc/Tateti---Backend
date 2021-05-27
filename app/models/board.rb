class Board < ApplicationRecord
	has_many :games
	has_many :users, through: :games



	def check_win(player)
		(self[:square00] == player && self[:square01] == player && self[:square02] == player) ||
		(self[:square10] == player && self[:square11] == player && self[:square12] == player) ||
		(self[:square20] == player && self[:square21] == player && self[:square22] == player) ||
		(self[:square00] == player && self[:square10] == player && self[:square20] == player) ||
		(self[:square01] == player && self[:square11] == player && self[:square21] == player) ||
		(self[:square02] == player && self[:square12] == player && self[:square22] == player) ||
		(self[:square00] == player && self[:square11] == player && self[:square22] == player) ||
		(self[:square02] == player && self[:square11] == player && self[:square20] == player) 
		

	end
	
		
end
