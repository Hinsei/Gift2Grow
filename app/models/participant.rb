class Participant < ApplicationRecord
	belongs_to :giveaways
	has_many :referrals
	validates :name, presence: true, length: { maximum: 40 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :contact, presence: true

#update later	
	def points_earn
		points = 0
	end 
	

	
end