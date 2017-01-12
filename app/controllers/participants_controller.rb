class ParticipantsController < ApplicationController
	
	def new
		@participant = Participant.new
	end
	
	def create
		@participant = current_user.participants.new(participant_params)
	   if @participant.save
	     redirect_to participant_path
	     #check route
	   end
	end
	
	def show
		@participant = @giveaway.participant_id.new
	end
	
	def destroy
		
	end
	
	def participant_params
		params.require(:participant).permit(:name, :email, :contact)
	end
	
end
