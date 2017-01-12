class CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :edit, :update]

    def index
      @companies = Company.all
    end

    def new
      @company =  Company.new
    end

    def create
      @company =  Company.new(company_params)
       if @company.save
         redirect_to @company
       else
         render :new
       end
    end

    def show
    end

    def edit
    end

    def update
      if @company.update(company_params)
        flash[:success] = "Info updated"
        redirect_to @company
      else
        flash[:danger] = "Error"
        render :edit
      end
    end

    private

    def company_params
      params.require(:company).permit(:email, :name, :password, :password_confirmation, :website, :social_media_link, :address, :contact)
    end

    def find_company
      @company = Company.find(params[:id])
    end

end
