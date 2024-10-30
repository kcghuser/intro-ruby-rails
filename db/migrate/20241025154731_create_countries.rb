class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :population
      t.string :continent

      t.timestamps
    end
  end
end
