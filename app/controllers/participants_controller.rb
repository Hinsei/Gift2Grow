class ParticipantsController < ApplicationController

	def new
		@participant = Participant.new
	end

	def create
		@giveaway_id = Giveaway.find(params[:giveaway_id])
		@participant = Participant.new(participant_params)
	   if @participant.save

	     redirect_to participant_path
	     #check route
	   end
	end

	def show
		@participant = @giveaway.participant.find(params[:id])
	end

	def destroy

	end

	def participant_params
		params.require(:participant).permit(:name, :email, :contact)
	end

end
