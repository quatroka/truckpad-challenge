# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171002204841) do

  create_table "shipment_vehicles", force: :cascade do |t|
    t.string "vehicle_type"
    t.string "vehicle_body_type"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_shipment_vehicles_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.float "value"
    t.integer "weight_kg"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "origin_city"
    t.string "origin_state"
    t.date "origin_load_at"
    t.string "destination_city"
    t.string "destination_state"
    t.date "destination_deliver_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truckers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "vehicle_type"
    t.string "vehicle_body_type"
    t.string "last_location_city"
    t.string "last_location_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
