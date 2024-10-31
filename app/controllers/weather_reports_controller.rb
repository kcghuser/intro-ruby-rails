class WeatherReportsController < ApplicationController
  def index
    @weather_reports = WeatherReport.page(params[:page]).per(10)
  end
end
def show
  @weather_report = WeatherReport.find(params[:id])
end