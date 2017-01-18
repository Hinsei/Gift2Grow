class GiveawaysController < ApplicationController

	before_action :find_company
	before_action :find_giveaway, only: [:show, :edit, :update, :destroy]

	def index
		@giveaways = @company.giveaways.all
		@url = original_url
	end

	def new
		@title = "Create"
		@giveaway = @company.giveaways.new
	end

	def create
		@giveaway = @company.giveaways.new(giveaway_params)
		if @giveaway.save
			winner = Winner.create(giveaway_id: @giveaway.id)
			delay_interval = @giveaway.end_date - DateTime.now
			WinnerSelectionJob.delay_until(delay_interval).perform_later(winner)
			flash[:notice] = "Giveaway creation successfull"
			redirect_to company_giveaways_path(@company, @giveaway)
		else
			flash[:error] = "Giveaway creation failed!"
			render 'new'
		end
	end

	def show
		if params[:giveaway_link].present?
			@giveaway = Giveaway.where(link: params[:giveaway_link])[0]
		else
			@giveaway = Giveaway.find(params[:id])
		end
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

	def original_url
		 request.base_url
	end


private

	def giveaway_params
		params.require(:giveaway).permit(:title, :description, :prize_name, :prize_image, :terms_and_condition, :winner_message, :consolation_message, :num_winner, :num_backup, :start_date, :end_date)
	end


	def find_giveaway
		if params[:company_id].present?
			@giveaway = @company.giveaways.find_by(id: params[:id])
		else
			@giveaway = Giveaway.find_by(link: params[:giveaway_link])
		end
	end

	def find_company
		if params[:company_id].present?
			@company = Company.find(params[:company_id])
		else
			@company = Company.find(Giveaway.find_by(link: params[:giveaway_link]).company_id)
		end
	end

end
