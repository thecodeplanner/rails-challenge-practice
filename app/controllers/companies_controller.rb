class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update]

def new
  @company = Company.new
  #code
end

def create
  byebug
  #code
end

def edit
  #code
end

def update
  if @company.employees.create(employee_params) && @company.update(company_params)
    redirect_to buildings_path
  else
    render :edit
  end
end

private
def set_company
  @company = Company.find(params[:id])
end

def company_params
  params.require(:company).permit(:name)
end

def employee_params
  params.require(:company).require(:employee).permit(:name, :title)
end
end
