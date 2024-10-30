# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Seed countries
10.times do
  country = Country.create(
    name: Faker::Address.country,
    population: Faker::Number.number(digits: 7),
    continent: Faker::Address.continent
  )

  # Seed cities for each country
  5.times do
    city = City.create(
      name: Faker::Address.city,
      population: Faker::Number.number(digits: 6),
      country: country
    )

    # Seed weather reports for each city
    3.times do
      WeatherReport.create(
        temperature: Faker::Number.decimal(l_digits: 2, r_digits: 1),
        description: Faker::Weather.description,
        date: Faker::Date.backward(days: 30),
        city: city
      )
    end
  end
end