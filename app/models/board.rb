class Board < ApplicationRecord

	belongs_to :player_x, class_name: 'User', optional: true
	belongs_to :player_o, class_name: 'User', optional: true
	has_many :games
	has_many :users, through: :games



	def check_win(player)
		winner = 
		(self[:square00] == player && self[:square01] == player && self[:square02] == player) ||
		(self[:square10] == player && self[:square11] == player && self[:square12] == player) ||
		(self[:square20] == player && self[:square21] == player && self[:square22] == player) ||
		(self[:square00] == player && self[:square10] == player && self[:square20] == player) ||
		(self[:square01] == player && self[:square11] == player && self[:square21] == player) ||
		(self[:square02] == player && self[:square12] == player && self[:square22] == player) ||
		(self[:square00] == player && self[:square11] == player && self[:square22] == player) ||
		(self[:square02] == player && self[:square11] == player && self[:square20] == player) 

		winner ? player : nil
	end
	
	def check_draw
		draw = 
		self[:square00].present? &&
		self[:square01].present? &&
		self[:square02].present? &&
		self[:square10].present? &&
		self[:square11].present? &&
		self[:square12].present? &&
		self[:square20].present? &&
		self[:square21].present? &&
		self[:square22].present?
		
		draw ? "draw" : nil
	end
		
end
