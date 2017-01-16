class ParticipantJoinMailer < ApplicationMailer
	default from: 'micerailsrat@gmail.com'

	def join_email(participant)
		@participant = participant
		@giveaway = @participant.giveaway
		mail(to: @participant.email, subject: "Joining of #{@giveaway.title} successful")
	end
end
