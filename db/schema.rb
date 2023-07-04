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

ActiveRecord::Schema[7.0].define(version: 2023_07_01_195642) do
  create_table "preferences", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.integer "pref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
    t.index ["video_id"], name: "index_preferences_on_video_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "videos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "code", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.string "thumbnails", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_videos_on_deleted_at"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "preferences", "users"
  add_foreign_key "preferences", "videos"
  add_foreign_key "videos", "users"
end
