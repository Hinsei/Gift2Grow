module GiveawaysHelper

	def giveaways?
		if @company.giveaways.count == 0
			false
		else
			true
		end
	end
end
