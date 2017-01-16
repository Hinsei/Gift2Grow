class Referral < ApplicationRecord

	# Validations
	validates :participant_id, presence: true

	# Associations
	belongs_to :participant

end
