class CitiesController < ApplicationController
  def index
    @countries = Country.all
    @cities = City.all
    if params[:query].present?
      @cities = @cities.where("name LIKE ?", "%#{params[:query]}%")
    end
    if params[:country_id].present?
      @cities = @cities.where(country_id: params[:country_id])
    end

    @cities = @cities.page(params[:page]).per(10)
  end
  end

  def show
    @city = City.includes(:weather_reports).find(params[:id])
    @weather_reports = @city.weather_reports.page(params[:page]).per(5) 
  end

