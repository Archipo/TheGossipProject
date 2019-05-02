class CitiesController < ApplicationController
  def index
  end

  def show
    @the_city = City.find(params[:id]).gossips
  end
end
