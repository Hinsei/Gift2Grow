class Winner < ApplicationRecord
	# Associations
	belongs_to :giveaway

	# Validations
	validates :winners, presence: true
end
