module GiveawaysHelper

	def giveaways?
		if @company.giveaways.count == 0
			false
		else
			true
		end
	end

	def winner?
		counter = 0
		@company.giveaways.each do |giveaway|
			unless giveaway.winner.winners.nil?
				counter += 1
			end
		end
		if counter == 0
			false
		else
			true
		end
	end
end
