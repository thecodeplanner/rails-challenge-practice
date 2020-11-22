class CompaniesController < ApplicationController

    def index
        @companies = Company.all 
    end

    def new
        @company = Company.new
    end
    
    def edit
        @company = Company.find(params[:id])
    end

    def update
    end


    def create
        @company = Company.create(company_params) 
        if @company.valid?
            redirect_to company_path(@company)
        else
            flash[:my_errors] = @company.errors.full_messages
            redirect_to new_company_path 
        end
    end

    def show
        @company = Company.find(params[:id])
        @employee = Employee.new
            if @employee.valid?
                redirect_to company_page(@company)
            end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
    end


    private

    def company_params
        params.require(:company).permit(:name)
    end


end