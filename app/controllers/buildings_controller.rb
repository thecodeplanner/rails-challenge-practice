class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update]

  def index
    @buildings = Building.all
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end
end
