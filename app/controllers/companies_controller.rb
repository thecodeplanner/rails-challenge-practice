class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    byebug
  end
end
