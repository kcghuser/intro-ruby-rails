class CountriesController < ApplicationController
  def index
    @countries = if params[:query].present?
      Country.where("name LIKE ?", "%#{params[:query]}%")
    else
      Country.all
    end
    @countries = @countries.page(params[:page]).per(5)
  end

  def show
    @country = Country.includes(:cities).find(params[:id])

  end
end

