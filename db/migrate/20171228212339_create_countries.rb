class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.text :name
      t.string :timezone
      t.references :currency, foreign_key: true
    end
  end
end
