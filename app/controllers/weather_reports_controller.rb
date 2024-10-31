class WeatherReportsController < ApplicationController
  def index
    @weather_reports = WeatherReport.all

    if params[:query].present?
      @weather_reports = @weather_reports.where("description LIKE ?", "%#{params[:query]}%")
    end
    if params[:start_date].present? && params[:end_date].present?
      @weather_reports = @weather_reports.where(date: params[:start_date]..params[:end_date])
    end
  @weather_reports = @weather_reports.page(params[:page]).per(10)
  end
end
def show
  @weather_report = WeatherReport.find(params[:id])
end