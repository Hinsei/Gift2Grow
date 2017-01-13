module GiveawaysControllerHelper

	def giveaways?
		if @company.giveaways.count == 0
			true
		else
			false
		end
	end

	def winners?
		if @company.giveaways
	end

end
