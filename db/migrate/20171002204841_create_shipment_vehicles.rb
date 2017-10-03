class CreateShipmentVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :shipment_vehicles do |t|
      t.string :vehicle_type
      t.string :vehicle_body_type

      t.belongs_to :shipment, index: true

      t.timestamps
    end
  end
end
