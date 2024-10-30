class Country < ApplicationRecord
  has_many :cities
  has_many :weather_reports, through: :cities
end