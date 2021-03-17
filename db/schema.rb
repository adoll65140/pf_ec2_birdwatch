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

ActiveRecord::Schema.define(version: 2021_03_16_003256) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "adoptions", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.text "health"
    t.text "other"
    t.text "background"
    t.boolean "flag", default: true
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "image_id"
    t.integer "breed_id"
    t.integer "user_id"
    t.integer "age"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bird_checks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bird_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "birds", force: :cascade do |t|
    t.string "bird_name"
    t.text "bird_introduction"
    t.string "bird_icon_id"
    t.date "bird_birthday"
    t.string "bird_back_image_id"
    t.integer "bird_age"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "breed_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item"
    t.text "introduction"
    t.boolean "flag", default: true
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "image_id"
    t.integer "genre_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lost_bird_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "lost_bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lost_birds", force: :cascade do |t|
    t.string "lost_bird_name"
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
    t.integer "breed_id"
  end

  create_table "lost_checks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lost_bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "visited_id"
    t.integer "room_id"
    t.integer "message_id"
    t.string "action"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "bird_id"
    t.integer "genre_id"
    t.text "body"
    t.string "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protection_bird_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "protection_bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protection_birds", force: :cascade do |t|
    t.string "bird_name"
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
    t.integer "breed_id"
  end

  create_table "protection_checks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "protection_bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
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
