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

ActiveRecord::Schema[7.0].define(version: 2023_10_17_103450) do
  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.string "role"
    t.string "permissions"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_memberships", force: :cascade do |t|
    t.string "membership_type"
    t.string "membership_description"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_payments", force: :cascade do |t|
    t.integer "client_id"
    t.string "membership_type"
    t.integer "payment_amount"
    t.string "payment_method"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_reviews", force: :cascade do |t|
    t.string "trainer_client_review"
    t.integer "client_id"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_trainer_relationships", force: :cascade do |t|
    t.integer "client_id"
    t.integer "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.string "role"
    t.string "membership_type"
    t.date "membership_start_date"
    t.date "membership_end_date"
    t.integer "trainer_id"
    t.text "fitness_goals"
    t.text "reviews"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_equipments", force: :cascade do |t|
    t.string "gym_equipment_type"
    t.string "gym_equipment_dexcription"
    t.string "model_number"
    t.string "serial_number"
    t.string "gym_maintenance_schedule"
    t.string "purchase_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_maintenances", force: :cascade do |t|
    t.string "gym_equipment_id"
    t.string "maintenance_cost"
    t.string "gym_maintenance_description"
    t.string "maintenance_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_reviews", force: :cascade do |t|
    t.string "gym_review"
    t.integer "client_id"
    t.date "gym_review_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "permission_name"
    t.string "permission_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_trackings", force: :cascade do |t|
    t.integer "client_id"
    t.string "progress_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.string "role_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainer_performances", force: :cascade do |t|
    t.integer "trainer_id"
    t.string "trainer_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone_number"
    t.string "role"
    t.string "skill_area"
    t.date "training_start_date"
    t.date "training_end_date"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
