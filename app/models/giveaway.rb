class Giveaway < ApplicationRecord
	require 'carrierwave/orm/activerecord'
	before_create :generate_link
	before_create :set_status
	enum status: {ongoing: 0, finished: 1}


	#Associations
	has_one :winner
	belongs_to :company
	has_many :participants

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
	validates :start_date, presence: true
	validates :end_date, presence: true

	#Associations
	belongs_to :company

private

	def generate_link
		self.link = "http://gift2grow/#{random_combo}"
	end

	def random_combo
		my_number = []
		selection = (1..9).to_a + ("a".."z").to_a
		8.times do
			my_number <<selection.sample(random: rand)
		end
		 my_number = my_number.join("")
		return my_number
	end

	def set_status
		self.status = 0
	end

end
