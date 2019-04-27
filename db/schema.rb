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

ActiveRecord::Schema.define(version: 2019_04_24_011914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "mac_address", default: "", null: false
    t.string "ip", default: "", null: false
    t.boolean "owner", default: false, null: false
    t.bigint "account_id", null: false
    t.bigint "room_id"
    t.bigint "port_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_computers_on_account_id"
    t.index ["ip"], name: "index_computers_on_ip", unique: true
    t.index ["mac_address"], name: "index_computers_on_mac_address", unique: true
    t.index ["name"], name: "index_computers_on_name", unique: true
    t.index ["port_id"], name: "index_computers_on_port_id"
    t.index ["room_id"], name: "index_computers_on_room_id"
  end

  create_table "ports", force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.boolean "enabled", default: true, null: false
    t.boolean "editable", default: true, null: false
    t.bigint "switch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["switch_id"], name: "index_ports_on_switch_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_rooms_on_account_id"
    t.index ["name"], name: "index_rooms_on_name", unique: true
  end

  create_table "switches", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "mac_address", default: "", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_switches_on_account_id"
    t.index ["mac_address"], name: "index_switches_on_mac_address", unique: true
    t.index ["name"], name: "index_switches_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "cpf", default: "", null: false
    t.boolean "owner", default: true, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
