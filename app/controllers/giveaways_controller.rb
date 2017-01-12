class GiveawaysController < ApplicationController

	before_action :find_company
	before_action :find_giveaway, only: [:show, :edit, :update. :destroy]

	def index
		@giveaways = @company.giveaways.all
	end

	def new
		@giveaway = @company.giveaways.new
	end

	def create
		@giveaway = @company.giveaways.new(giveaway_params)
		if @giveaway.save
			flash[:notice] = "Giveaway creation successfull"
			redirect to company_giveaway_path(@company, @giveaway)
		else
			flash[:error] = "Giveaway creation failed!"
			render 'new'
		end
	end

	def show
	end

	def edit
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
		params.require(:giveaway).permit(:title, :description, :prize_name, :prize_image, :terms_and_condition, :winner_message, :consolation_message, :num_winner, :num_backup)
	end

	def find_giveaway
		@giveaway = @company.giveaways.find_by_(id: params[:id])
	end

	def find_company
		@company = Company.find(params[:company_id])
	end


end