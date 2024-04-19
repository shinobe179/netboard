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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_074311) do
  create_table "datacenters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "network_rack_id", null: false
    t.integer "device_type_id"
    t.index ["device_type_id"], name: "index_devices_on_device_type_id"
    t.index ["network_rack_id"], name: "index_devices_on_network_rack_id"
  end

  create_table "interface_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interfaces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ipaddr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "device_id", null: false
    t.integer "interface_status_id"
    t.integer "peer_interface_id"
    t.index ["device_id"], name: "index_interfaces_on_device_id"
    t.index ["interface_status_id"], name: "index_interfaces_on_interface_status_id"
    t.index ["peer_interface_id"], name: "index_interfaces_on_peer_interface_id"
  end

  create_table "network_racks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "height", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "datacenter_id", null: false
    t.index ["datacenter_id"], name: "index_network_racks_on_datacenter_id"
  end

  add_foreign_key "devices", "device_types"
  add_foreign_key "devices", "network_racks"
  add_foreign_key "interfaces", "devices"
  add_foreign_key "interfaces", "interface_statuses"
  add_foreign_key "interfaces", "interfaces", column: "peer_interface_id"
  add_foreign_key "network_racks", "datacenters"
end
