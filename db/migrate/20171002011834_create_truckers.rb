class CreateTruckers < ActiveRecord::Migration[5.1]
  def change
    create_table :truckers do |t|
      t.string :name
      t.string :phone

      t.string :vehicle_type
      t.string :vehicle_body_type

      t.string :last_location_city
      t.string :last_location_state

      t.timestamps
    end
  end
end
