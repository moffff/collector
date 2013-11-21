class CreateVisitedCountries < ActiveRecord::Migration
  def change
    create_table :visited_countries do |t|
      t.integer :country_id
      t.timestamps
    end
  end
end
