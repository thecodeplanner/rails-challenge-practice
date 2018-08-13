class CompaniesController < ApplicationController
	before_action :set_company, only: [:edit, :update, :show]

def new
	@company = Company.new
	#code
end

def create
	@company = Company.new(company_params)

	if @company.save
		params[:company][:offices_attributes].each do |key, building_data|
			building = Building.find(building_data[:id])

			if building
				floors = building_data[:offices]

				floors.each do |floor|
					if !floor.empty?
						Office.create!(building: building, company: @company, floor: floor)
					end
				end
			end


		end
		redirect_to @company
	end
	#code
end

def show
	@employee = Employee.new
end

def add_employee
	@employee = Employee.new(employee_params)

	if @employee.save
		redirect_to @employee.company
	end
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
	params.require(:employee).permit(:name, :title, :company_id)
end
end
