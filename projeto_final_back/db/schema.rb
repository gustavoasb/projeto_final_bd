# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "cep", limit: 20, null: false
    t.string "street", limit: 45, null: false
    t.integer "number", null: false
    t.string "complement", limit: 45
    t.integer "district_id", null: false
  end

  create_table "attendants", primary_key: "cpf", id: :string, limit: 45, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.date "birth_date", null: false
    t.date "hiring_date", null: false
    t.integer "unit_id", null: false
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "uf_id", null: false
  end

  create_table "districts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "city_id", null: false
  end

  create_table "doctor_has_specialization", primary_key: ["doctor_crm", "specialization_id"], force: :cascade do |t|
    t.string "doctor_crm", limit: 45, null: false
    t.integer "specialization_id", null: false
  end

  create_table "doctors", primary_key: "crm", id: :string, limit: 45, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "room", limit: 45, null: false
    t.integer "unit_id", null: false
  end

  create_table "entries", id: :serial, force: :cascade do |t|
    t.boolean "was_attended", null: false
    t.datetime "arrival_time", null: false
    t.string "user_cpf", limit: 45, null: false
    t.string "doctor_crm", limit: 45, null: false
    t.integer "health_condition_id", null: false
  end

  create_table "entry_has_symptom", primary_key: ["entry_id", "symptom_id"], force: :cascade do |t|
    t.integer "entry_id", null: false
    t.integer "symptom_id", null: false
  end

  create_table "health_conditions", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "priority", null: false
  end

  create_table "hospitals", id: :serial, force: :cascade do |t|
    t.string "abbreviation", limit: 10, null: false
    t.string "name", limit: 35, null: false
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.string "message", limit: 100, null: false
    t.datetime "sent_at", null: false
    t.string "user_cpf", limit: 45, null: false
    t.integer "entry_id"
  end

  create_table "specializations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "year", null: false
  end

  create_table "symptoms", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
  end

  create_table "telephones", id: :serial, force: :cascade do |t|
    t.string "cell_phone", limit: 45, null: false
    t.string "home_phone", limit: 45, null: false
  end

  create_table "ufs", id: :serial, force: :cascade do |t|
    t.string "name", limit: 2, null: false
  end

  create_table "units", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "hospital_id", null: false
    t.integer "address_id", null: false
  end

  create_table "users", primary_key: "cpf", id: :string, limit: 45, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "email", limit: 45, null: false
    t.date "birth_date", null: false
    t.integer "telephone_id", null: false
  end

  add_foreign_key "addresses", "districts", name: "addresses_district_id_fkey"
  add_foreign_key "attendants", "hospitals", column: "unit_id", name: "attendants_unit_id_fkey"
  add_foreign_key "cities", "ufs", name: "cities_uf_id_fkey"
  add_foreign_key "districts", "cities", name: "districts_city_id_fkey"
  add_foreign_key "doctor_has_specialization", "doctors", column: "doctor_crm", primary_key: "crm", name: "doctor_has_specialization_doctor_crm_fkey"
  add_foreign_key "doctor_has_specialization", "specializations", name: "doctor_has_specialization_specialization_id_fkey"
  add_foreign_key "doctors", "units", name: "doctors_unit_id_fkey"
  add_foreign_key "entries", "doctors", column: "doctor_crm", primary_key: "crm", name: "entries_doctor_crm_fkey"
  add_foreign_key "entries", "health_conditions", name: "entries_health_condition_id_fkey"
  add_foreign_key "entries", "users", column: "user_cpf", primary_key: "cpf", name: "entries_user_cpf_fkey"
  add_foreign_key "entry_has_symptom", "entries", name: "entry_has_symptom_entry_id_fkey"
  add_foreign_key "entry_has_symptom", "symptoms", name: "entry_has_symptom_symptom_id_fkey"
  add_foreign_key "notifications", "entries", name: "notifications_entry_id_fkey"
  add_foreign_key "notifications", "users", column: "user_cpf", primary_key: "cpf", name: "notifications_user_cpf_fkey"
  add_foreign_key "units", "addresses", name: "units_address_id_fkey"
  add_foreign_key "units", "hospitals", name: "units_hospital_id_fkey"
  add_foreign_key "users", "telephones", name: "users_telephone_id_fkey"
end
