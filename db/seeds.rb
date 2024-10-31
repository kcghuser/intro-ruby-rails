# db/seeds.rb
require 'faker'

# List of continents to use as sample data
continents = ["Africa", "Asia", "Europe", "North America", "South America", "Oceania", "Antarctica"]

# Clear existing data to avoid duplicates if the seeds are run multiple times
Country.destroy_all
City.destroy_all
WeatherReport.destroy_all

# Seed countries
10.times do
  country = Country.create!(
    name: Faker::Address.country,
    population: Faker::Number.number(digits: 7),
    continent: continents.sample # Randomly choose a continent from the array
  )

  # Seed cities for each country
  5.times do
    city = City.create!(
      name: Faker::Address.city,
      population: Faker::Number.number(digits: 6),
      country: country
    )

    # Seed weather reports for each city
    3.times do
      WeatherReport.create!(
        temperature: Faker::Number.decimal(l_digits: 2, r_digits: 1),
        description: Faker::Lorem.sentence(word_count: 3), # Use a simple sentence for description
        date: Faker::Date.backward(days: 30),
        city: city
      )
    end
  end
end

puts "Seeding completed successfully!"