class ParticipantsController < ApplicationController
	def new
		@participant = Participant.new
	end

	def create
		@participant = Participant.new(participant_params)
		@participant.giveaway_id = params[:participant][:gvId]
		@referral = Participant.where(referral_identification: params[:participant][:refId])[0]
	   if @referral.present? && @participant.save
			Referral.create(participant_id: @referral.id)
			@referral.points += 1
			@referral.save!
			redirect_to @participant
		 elsif @participant.save
	    redirect_to @participant
		 else
			 flash[:error] = "Failed"
			 render :new
	   end

	end

	def show
		@participant = Participant.find(params[:id])
		@giveaway = @participant.giveaway
		@company = @participant.giveaway.company

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
