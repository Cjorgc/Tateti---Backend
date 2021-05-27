class User < ApplicationRecord
	validates :name, :username, :password , presence: true
	validates :password, length: {minimum: 8}
	validates :username, uniqueness: true

	before_create :set_token

	has_many :games
	has_many :boards, through: :games

	def set_token
		self.token = SecureRandom.urlsafe_base64
	end

	def remove_token
		self.token = nil
	end

	def valid_password? (pass)
		password.present? && password == pass
	end
		
end
