class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.float :value
      t.integer :weight_kg

      t.string :contact_name
      t.string :contact_phone

      t.string :origin_city
      t.string :origin_state
      t.date :origin_load_at

      t.string :destination_city
      t.string :destination_state
      t.date :destination_deliver_at

      t.timestamps
    end
  end
end
