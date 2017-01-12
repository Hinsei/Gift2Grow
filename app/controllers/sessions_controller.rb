class SessionsController < ApplicationController

	def new
		render "sessions/new"
	end

	def create
		company = Company.find_by_email(params[:session][:email])
		if company && company.authenticate(params[:session][:password])
			session[:company_id] = company.id
			redirect_to company_giveaways_path(company.id)
		else
			# flash[:alert] = "Please try again"
			render "session/new"
			# redirect_to root_path
		end
	end

	def destroy
		session[:company_id] = nil
		redirect_to root_path
	end
end
