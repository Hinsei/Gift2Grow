class Participant < ApplicationRecord
	before_create :points_earn
	before_create :set_referral_identification

	# Associations
	belongs_to :giveaway
	has_many :referrals

	# Validations
	validates :name, presence: true, length: { maximum: 40 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :contact, presence: true

#update later
	def points_earn
		self.points = 0
	end

	def set_referral_identification
		self.referral_identification = SecureRandom.base64(5)
	end

end
