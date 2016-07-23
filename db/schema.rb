# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160723130352) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "neighborhood"
    t.string   "number"
    t.string   "cep"
    t.text     "complement"
    t.integer  "city_id"
    t.integer  "person_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"
  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id"

  create_table "beneficiaries", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "person_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_active",     default: true
  end

  add_index "beneficiaries", ["department_id"], name: "index_beneficiaries_on_department_id"
  add_index "beneficiaries", ["person_id"], name: "index_beneficiaries_on_person_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "citizens", force: :cascade do |t|
    t.boolean  "leader"
    t.string   "social_role"
    t.integer  "person_id"
    t.integer  "comunity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "citizens", ["comunity_id"], name: "index_citizens_on_comunity_id"
  add_index "citizens", ["person_id"], name: "index_citizens_on_person_id"

  create_table "comunities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "generators_theme"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_active",   default: true
  end

  create_table "diaries", force: :cascade do |t|
    t.text     "description"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "beneficiary_id"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "axis"
  end

  add_index "diaries", ["beneficiary_id"], name: "index_diaries_on_beneficiary_id"
  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id"

  create_table "first_contact_files", force: :cascade do |t|
    t.date     "date"
    t.integer  "hour"
    t.string   "institution"
    t.integer  "operational_context_first_contact"
    t.integer  "how_established_first_contact"
    t.integer  "contact_source_type"
    t.integer  "how_person_knew_about_the_organization"
    t.integer  "beneficiary_and_contact_source_relationship"
    t.boolean  "is_new_partner"
    t.integer  "number_of_previous_treatments"
    t.integer  "place_of_previous_treatments"
    t.integer  "marital_status"
    t.integer  "number_sons"
    t.integer  "number_daughters"
    t.integer  "ethnic_group"
    t.string   "religion"
    t.integer  "family_structure"
    t.string   "education_levels"
    t.integer  "job"
    t.string   "first_contact_conditions"
    t.string   "petitions"
    t.string   "answer"
    t.string   "results"
    t.text     "comments"
    t.integer  "beneficiary_id"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "contact_source_id"
    t.integer  "support_id"
  end

  add_index "first_contact_files", ["beneficiary_id"], name: "index_first_contact_files_on_beneficiary_id"
  add_index "first_contact_files", ["user_id"], name: "index_first_contact_files_on_user_id"

  create_table "partners", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "fantasy_name"
    t.integer  "people_id"
    t.integer  "contact_person_1_id"
    t.integer  "contact_person_2_id"
    t.string   "cnpj"
    t.integer  "partner_type"
    t.boolean  "is_active",           default: true
    t.string   "work_areas"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "partners", ["person_id"], name: "index_partners_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.integer  "age",        default: 0
    t.integer  "gender"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email"
    t.string   "last_name"
    t.date     "birthdate"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phones", ["person_id"], name: "index_phones_on_person_id"

  create_table "points", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "comunity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "points", ["comunity_id"], name: "index_points_on_comunity_id"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.boolean  "is_active",              default: true
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["person_id"], name: "index_users_on_person_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
