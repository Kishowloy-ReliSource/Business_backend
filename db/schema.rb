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

ActiveRecord::Schema[7.0].define(version: 2023_03_02_192315) do
  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bikes", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "year"
    t.string "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "status"
    t.date "dob"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_dealers_on_admin_id"
  end

  create_table "lessees", force: :cascade do |t|
    t.string "lesseename"
    t.string "lesseeaddress"
    t.string "lesseephone"
    t.integer "lesseemonthlyincome"
    t.date "lesseedob"
    t.string "colesseename"
    t.string "colesseeaddress"
    t.string "colessephone"
    t.integer "colesseemonthlyincome"
    t.date "colesseedob"
    t.integer "downpayment"
    t.integer "bike_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "approved"
    t.index ["bike_id"], name: "index_lessees_on_bike_id"
  end

  add_foreign_key "dealers", "admins"
  add_foreign_key "lessees", "bikes"
end
