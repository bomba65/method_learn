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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170801115926) do
=======
ActiveRecord::Schema.define(version: 20170731143245) do
>>>>>>> 91704c71280335a10d2874bb24e9a1b6d68dd9f7

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_to_categories", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.integer  "language"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "instructions", force: :cascade do |t|
    t.text     "content"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.integer  "part_id"
    t.integer  "lesson_order"
    t.integer  "course_id"
    t.text     "exist_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "part_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_of_lessons", force: :cascade do |t|
    t.integer  "user_to_course_id"
    t.integer  "lesson_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

# Could not dump table "tasks" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "theories", force: :cascade do |t|
    t.text     "content"
    t.string   "video"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_to_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "progress",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_to_courses", ["course_id"], name: "index_user_to_courses_on_course_id"
  add_index "user_to_courses", ["user_id", "course_id"], name: "index_user_to_courses_on_user_id_and_course_id", unique: true
  add_index "user_to_courses", ["user_id"], name: "index_user_to_courses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
