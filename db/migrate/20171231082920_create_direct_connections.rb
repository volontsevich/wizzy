class CreateDirectConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :direct_connections do |t|
      t.references :airport, foreign_key: true
      t.integer :connected_airport_id
    end
  end
end
