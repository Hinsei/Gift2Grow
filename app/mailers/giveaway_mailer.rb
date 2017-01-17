class GiveawayMailer < ApplicationMailer
	default form: "micerailsrat@gmail.com"

	def winner_email(winner)
		@participant = winner
		@giveaway = winner.giveaway
		mail(to: @participant.email, subject: "You Have Been Chosen As a Winner!")
	end

	def company_notification_email(winners)
		@winners = winners.main_winners
		@backups = winners.backup_winners
		@giveaway = Giveaway.find(winners.giveaway_id)
		@company = @giveaway.company
		mail(to: @company.email, subject: "A Giveaway Under Your Company Has Been Completed")
	end

	def consolation_email(participant)
		@participant = participant
		@giveaway = participant.giveaway
		mail(to: @participant.email, subject: "A Giveaway You Joined With Us Is Done")
	end

end
