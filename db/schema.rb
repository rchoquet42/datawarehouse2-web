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

ActiveRecord::Schema[7.0].define(version: 2022_09_14_153331) do
  create_table "authors", force: :cascade do |t|
    t.integer "user_id"
    t.text "about"
    t.text "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_path"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "institution"
    t.string "department"
    t.string "head"
    t.string "head_email"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.string "review"
    t.integer "note"
    t.string "reviewer_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.text "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teaching_requests", force: :cascade do |t|
    t.integer "user_id"
    t.text "job"
    t.text "why"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "validated?", default: false
    t.boolean "waiting?", default: true
    t.integer "department_id"
    t.index ["department_id"], name: "index_teaching_requests_on_department_id"
    t.index ["user_id"], name: "index_teaching_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at"
    t.string "password_digest"
    t.string "unconfirmed_email"
    t.string "remember_token"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "authors", "users"
end
