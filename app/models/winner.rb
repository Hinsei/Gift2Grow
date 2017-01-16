class Winner < ApplicationRecord
	# Associations
	belongs_to :giveaway

	def choose_winner(winner)
		targeted_giveaway = winner.giveaway
		main_container = []
		backup_container = []
		entries = []
		contestants = winner.giveaway.participants

		contestants.each do |contestant|
			number_of_entries = contestant.referrals.count + 1
			(1..number_of_entries).each do |number|
				entries << contestant.id
			end
		end

		unless main_container.count == targeted_giveaway.num_winner
			main_container << entries.shuffle.sample(targeted_giveaway.num_winner, random: rand)
			winner.winners = main_container.first
			entries = entries - main_container.shift
		end

		unless backup_container.count == targeted_giveaway.num_backup
			backup_container << entries.shuffle.sample(targeted_giveaway.num_winner, random: rand)
			winner.backup_winners = backup_container.first
			entries = entries - backup_container.shift
		end

		if winner.winners.count == targeted_giveaway.num_winner && winner.backup_winners.count == targeted_giveaway.num_backup
			winner.save
		else
			raise "Something went wrong"
		end

	end

end
