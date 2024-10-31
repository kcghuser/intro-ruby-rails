class CitiesController < ApplicationController
  def index
    @cities = if params[:query].present?
      City.where("name LIKE ?", "%#{params[:query]}%")
    else
      City.all
    end
    @cities = @cities.page(params[:page]).per(10)
  end
  end

  def show
    @city = City.includes(:weather_reports).find(params[:id])
    @weather_reports = @city.weather_reports.page(params[:page]).per(5) # Paginate weather reports on city show page
  end

