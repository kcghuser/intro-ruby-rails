class WeatherReportsController < ApplicationController
  def index
    @weather_reports = WeatherReport.all
  end
end
def show
  @weather_report = WeatherReport.find(params[:id]) # Fetches a single weather report based on ID
end