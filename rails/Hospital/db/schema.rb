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

ActiveRecord::Schema.define(version: 2018_04_18_065402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "patients_id"
    t.bigint "doctors_id"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctors_id"], name: "index_appointments_on_doctors_id"
    t.index ["patients_id"], name: "index_appointments_on_patients_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.bigint "ph_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "specialization_id"
    t.decimal "salary"
    t.index ["specialization_id"], name: "index_doctors_on_specialization_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.date "d_o_b"
    t.string "gender"
    t.bigint "ph_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "appointments", "doctors", column: "doctors_id"
  add_foreign_key "appointments", "patients", column: "patients_id"
  add_foreign_key "doctors", "specializations"
end
