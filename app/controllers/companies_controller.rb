class CompaniesController < ApplicationController

    def index
      @companies = Company.all
    end

    def new
      @company =  Company.new

    def create
      @company =  Company.new(company_params)
       if @company.save
         redirect_to '/companies/show'
       else
         render :new
       end
    end

    def show
      @company = Company.find(params[:id])
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
      params.require(:company).permit(:email, :name, :password_digest, :password, :password_confirmation)
    end

end
