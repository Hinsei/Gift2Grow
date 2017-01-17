class WinnerSelectionJob < ApplicationJob
  queue_as :default

  def perform(winner_object)
  	# email for winner
  	winner_object.choose_winner
  	winners = winner_object.main_winners
  	winners.each do |winner|
  		GiveawayMailer.winner_email(Participant.where(id: winner, giveaway_id: winner_object.giveaway_id).deliver_now
  	end
  	# consolation email for non-winners
  	all_winners = []
    winners.each{|x| all_winners << x}
    winner_object.backup_winners.each{|x| all_winners << x}
    non_winners = winner_object.giveaway.participants - all_winners
    non_winners.each do |non_winner|
    	GiveawayMailer.consolation_email(non_winner).deliver_now
    end
    # notification for company
    GiveawayMailer.company_notification_email(winner_object).deliver_now
  end
end
