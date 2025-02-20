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

ActiveRecord::Schema[7.0].define(version: 2025_01_19_054525) do
  create_table "diaries", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "written_on", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diary_tags", force: :cascade do |t|
    t.integer "diary_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_diary_tags_on_diary_id"
    t.index ["tag_id"], name: "index_diary_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "activation_digest"
    t.boolean "activated", default: false, null: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "diaries", "users"
  add_foreign_key "diary_tags", "diaries"
  add_foreign_key "diary_tags", "tags"
end
