class Giveaway < ApplicationRecord
	require 'carrierwave/orm/activerecord'

	#Image Uploading
	mount_uploader :prize_image, PrizeImageUploader
	mount_uploader :terms_and_condition, TermsAndConditionUploader

	#Validations
	validates :title, presence: true
	validates :prize_name, presence: true
	validates	:prize_image, presence: true
	validates	:terms_and_condition, presence: true
	validates	:winner_message, presence: true
	validates	:consolation_message, presence: true
	validates	:num_winner, presence: true
	validates :num_backup, presence: true

	#Associations
	belongs_to :company

end
