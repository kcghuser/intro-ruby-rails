class CountriesController < ApplicationController
  def index
    if params[:query].present?
      @countries = Country.where("name LIKE ?", "%#{params[:query]}%")
    else
      @countries = Country.all
    end
  end

  def show
    @country = Country.find(params[:id])
    @country = Country.includes(:cities).find(params[:id])

  end
end

