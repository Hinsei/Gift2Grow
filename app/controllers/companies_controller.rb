class CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = Company.all
    end

    def new
      @company =  Company.new
    end

    def create
      params[:company][:social_media_link] =  [] << params[:company][:social_media_link]
      @company =  Company.new(company_params)
      byebug
       if @company.save
         session[:company_id] = @company.id
         redirect_to company_giveaways_path(@company)
       else
         render :new
       end
    end

    def show
    end

    def edit
    end

    def update
        params[:company][:social_media_link] =  [] << params[:company][:social_media_link]
        if @company.update(company_params)
        flash[:success] = "Info updated"
        redirect_to @company
      else
        flash[:danger] = "Error"
        render :edit
      end
    end

    def destroy
      if @company.destroy
        redirect_to companies_path
      end
    end

    private

    def company_params
      params.require(:company).permit(:email, :name, :password, :password_confirmation, :website, :address, :contact, :role, :social_media_link => [])
    end

    def find_company
      @company = Company.find(params[:id])
    end
end
