class GiveawaysController < ApplicationController

	before_action :find_company
	before_action :find_giveaway, only: [:show, :edit, :update, :destroy]

	def index
		@giveaways = @company.giveaways.all
	end

	def new
		@title = "Create"
		@giveaway = @company.giveaways.new
	end

	def create
		@giveaway = @company.giveaways.new(giveaway_params)
		if @giveaway.save
			Winner.create(giveaway_id: @giveaway.id)
			flash[:notice] = "Giveaway creation successfull"
			redirect_to company_giveaways_path(@company, @giveaway)
		else
			flash[:error] = "Giveaway creation failed!"
			render 'new'
		end
	end

	def show
		@participant = Participant.where(referral_identification: params[:refId])[0]
	end

	def edit
		@title = "Edit"
	end

	def update
		if @giveaway.update(giveaway_params)
			redirect_to company_giveaway_path(@company, @giveaway)
		else
			render 'edit'
		end
	end

	def destroy
		if @giveaway.destroy
			redirect_to @company
		else
			redirect_to company_giveaway_path(@company, @giveaway)
		end
	end

private

	def giveaway_params
		params.require(:giveaway).permit(:title, :description, :prize_name, :prize_image, :terms_and_condition, :winner_message, :consolation_message, :num_winner, :num_backup, :start_date, :end_date)
	end

	def find_giveaway
		@giveaway = @company.giveaways.find_by(id: params[:id])
	end

	def find_company
		@giveaway = Giveaway.find(params[:id])
		@company = @giveaway.company
	end

end
