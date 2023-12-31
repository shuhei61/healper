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

ActiveRecord::Schema[7.0].define(version: 2023_07_22_121219) do
  create_table "calendar_foods", charset: "utf8", force: :cascade do |t|
    t.bigint "calendar_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_calendar_foods_on_calendar_id"
    t.index ["food_id"], name: "index_calendar_foods_on_food_id"
  end

  create_table "calendar_pre_foods", charset: "utf8", force: :cascade do |t|
    t.bigint "calendar_id", null: false
    t.bigint "pre_food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_calendar_pre_foods_on_calendar_id"
    t.index ["pre_food_id"], name: "index_calendar_pre_foods_on_pre_food_id"
  end

  create_table "calendars", charset: "utf8", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_calendars_on_user_id"
  end

  create_table "foods", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbohydrate", null: false
    t.integer "calorie", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "pre_foods", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbohydrate", null: false
    t.integer "calorie", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "gender_id", null: false
    t.integer "age", null: false
    t.float "height", null: false
    t.float "weight", null: false
    t.integer "level_id", null: false
    t.integer "essential_cal", null: false
    t.float "fat_body", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wants", charset: "utf8", force: :cascade do |t|
    t.integer "protein", null: false
    t.integer "fat", null: false
    t.integer "carbohydrate", null: false
    t.float "diet_weight", null: false
    t.integer "diet_protein", null: false
    t.integer "diet_fat", null: false
    t.integer "diet_carbohydrate", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wants_on_user_id"
  end

  add_foreign_key "calendar_foods", "calendars"
  add_foreign_key "calendar_foods", "foods"
  add_foreign_key "calendar_pre_foods", "calendars"
  add_foreign_key "calendar_pre_foods", "pre_foods"
  add_foreign_key "calendars", "users"
  add_foreign_key "foods", "users"
  add_foreign_key "wants", "users"
end
