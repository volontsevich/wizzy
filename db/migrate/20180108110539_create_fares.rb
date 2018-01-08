class CreateFares < ActiveRecord::Migration[5.0]
  def change
    create_table :fares do |t|
      t.integer :dep_airport_id
      t.integer :arr_airport_id
      t.float :amount
      t.timestamps null: false
    end
  end
end
