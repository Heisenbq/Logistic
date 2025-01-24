# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_22_090427) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "deliveries", id: :serial, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "vehicle_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "delivery_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_deliveries_on_driver_id"
    t.index ["order_id"], name: "index_deliveries_on_order_id"
    t.index ["vehicle_id"], name: "index_deliveries_on_vehicle_id"
  end

  create_table "drivers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "license_number", null: false
    t.string "phone_number"
    t.date "employment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["license_number"], name: "index_drivers_on_license_number", unique: true
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.datetime "order_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "delivery_address"
    t.string "customer_name"
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.string "registration_number"
    t.string "model"
    t.integer "year"
    t.integer "capacity"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_number"], name: "index_vehicles_on_registration_number", unique: true
  end

  add_foreign_key "deliveries", "drivers"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "deliveries", "vehicles"
end
