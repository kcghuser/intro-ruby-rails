class City < ApplicationRecord
  belongs_to :country
  has_many :weather_reports
end