class GiveawayMailer < ApplicationMailer
	default form: "micerailsrat@gmail.com"

	def winner_email(winners)
		@winners = winners.main_winners
		@giveaway = Giveaway.find(winners.giveaway_id)
		@winners.each do |winner|
			@participant = Participant.where(giveaway_id: @giveaway.id, id: winner)[0]
			mail(to: @participant.email, subject: "You Have Been Chosen As a Winner!")
		end
	end

	def company_notification_mail(winners)
		@winners = winners.main_winners
		@backups = winnners.backup_winners
		@giveaway = Giveaway.find(winners.giveaway_id)
		@company = @giveaway.company
		mail(to: @company.email, subject: "A Giveaway Under Your Company Has Been Completed")
	end

	def consolation_email(winners)
		@giveaway = Giveaway.find(winners.giveaway_id)
		participants = @giveaway.participants
		winners = []
		@giveaway.winner.main_winners.each do |x|
			winners << Participant.find(x)
		end
		@giveaway.winner.backup_winners.each do |y|
			winners << Participant.find(y)
		end
		consolations = participants - winners
		consolations.each do |consolation|
			@participant = consolation
			mail(to: @participant.email, subject: "A Giveaway You Joined with Us Is Done!")
		end
	end

end
