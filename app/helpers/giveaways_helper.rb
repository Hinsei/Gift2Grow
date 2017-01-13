module GiveawaysControllerHelper

	def giveaways?
		if @company.giveaways.count == 0
			true
		else
			false
		end
	end

end
