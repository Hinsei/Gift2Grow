module GiveawaysHelper

	def giveaways?
		if @company.giveaways.count == 0
			false
		else
			true
		end
	end

	def winner?
		if finished.count > 0
			true
		end
	end

	def ongoing
		@giveaways.where(status: 0)
	end

	def finished
		@giveaways.where(status: 1)
	end
end
