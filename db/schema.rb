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

ActiveRecord::Schema.define(version: 2021_03_10_005800) do

  create_table "birds", force: :cascade do |t|
    t.string "bird_name"
    t.string "breed"
    t.text "bird_introduction"
    t.string "bird_icon_id"
    t.date "bird_birthday"
    t.string "bird_back_image_id"
    t.integer "bird_age"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lost_birds", force: :cascade do |t|
    t.string "lost_bird_name"
    t.string "lost_bird_breed"
    t.text "lost_bird_introduction"
    t.string "bird_image_id"
    t.date "lost_day"
    t.integer "lost_bird_age"
    t.integer "user_id"
    t.string "lost_place"
    t.text "feature"
    t.text "lost_introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "flag", default: true
  end

  create_table "protection_birds", force: :cascade do |t|
    t.string "bird_name"
    t.string "breed"
    t.text "bird_introduction"
    t.string "image_id"
    t.date "protect_day"
    t.integer "bird_age"
    t.integer "user_id"
    t.string "protect_place"
    t.text "feature"
    t.text "protect_introduction"
    t.boolean "flag", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "postal_code"
    t.string "address"
    t.string "telephone_number"
    t.boolean "is_deleted", default: false
    t.string "nickname"
    t.text "introduction"
    t.string "icon_id"
    t.string "back_image_id"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
