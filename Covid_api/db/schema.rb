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

ActiveRecord::Schema.define(version: 2021_02_01_184216) do

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.string "lab"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "document_number"
    t.string "city"
    t.datetime "birth_date"
    t.integer "provice"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "patient_id", null: false
    t.integer "test_group_id", null: false
    t.index ["patient_id"], name: "index_patients_on_patient_id"
    t.index ["test_group_id"], name: "index_patients_on_test_group_id"
  end

  create_table "test_groups", force: :cascade do |t|
    t.string "name"
    t.integer "max_applicants"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "drug_id", null: false
    t.index ["drug_id"], name: "index_test_groups_on_drug_id"
  end

  add_foreign_key "patients", "patients"
  add_foreign_key "patients", "test_groups"
  add_foreign_key "test_groups", "drugs"
end
