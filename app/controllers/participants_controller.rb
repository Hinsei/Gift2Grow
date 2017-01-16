class ParticipantsController < ApplicationController
	def new
		@participant = Participant.new
	end

	def create

		@participant = Participant.new(participant_params)
		@participant.giveaway_id = params[:participant][:gvId]
	   if @participant.save
	     redirect_to @participant
	     #check route
		 else
			 flash[:error] = "Failed"
			 render :new
	   end

	end

	def show
		@participant = Participant.find(params[:id])

	end

	def destroy

	end

	def participant_params
		params.require(:participant).permit(:name, :email, :contact)
	end

	def find_giveaway
		@giveaway = Giveaway.find(params[:gvId])
	end

end
