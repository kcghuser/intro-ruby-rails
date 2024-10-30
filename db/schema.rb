# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_25_154744) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.string "continent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_reports", force: :cascade do |t|
    t.decimal "temperature"
    t.string "description"
    t.date "date"
    t.integer "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_weather_reports_on_city_id"
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "weather_reports", "cities"
end
