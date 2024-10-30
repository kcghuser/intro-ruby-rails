class CreateWeatherReports < ActiveRecord::Migration[7.2]
  def change
    create_table :weather_reports do |t|
      t.decimal :temperature
      t.string :description
      t.date :date
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
