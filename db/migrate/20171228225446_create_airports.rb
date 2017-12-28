class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.string :short_name
      t.float :latitude
      t.float :longitude
      t.references :city, foreign_key: true
    end
  end
end
