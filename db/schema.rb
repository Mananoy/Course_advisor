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

ActiveRecord::Schema.define(version: 2021_10_17_194216) do

  create_table "authie_sessions", force: :cascade do |t|
    t.string "token"
    t.string "browser_id"
    t.integer "user_id"
    t.boolean "active", default: true
    t.text "data"
    t.datetime "expires_at"
    t.datetime "login_at"
    t.string "login_ip"
    t.datetime "last_activity_at"
    t.string "last_activity_ip"
    t.string "last_activity_path"
    t.string "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_type"
    t.integer "parent_id"
    t.datetime "two_factored_at"
    t.string "two_factored_ip"
    t.integer "requests", default: 0
    t.datetime "password_seen_at"
    t.string "token_hash"
    t.string "host"
    t.index ["browser_id"], name: "index_authie_sessions_on_browser_id"
    t.index ["token"], name: "index_authie_sessions_on_token"
    t.index ["token_hash"], name: "index_authie_sessions_on_token_hash"
    t.index ["user_id"], name: "index_authie_sessions_on_user_id"
  end

  create_table "course_advices", force: :cascade do |t|
    t.integer "advice_ID"
    t.string "student_ID"
    t.string "course_ID"
    t.text "note"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "degree_year"
    t.string "teaching_period"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_ID"
    t.string "name"
    t.string "subject_area"
    t.integer "catalogue"
    t.string "prerequisite"
    t.string "corequisite"
    t.string "assumed_knowledge"
    t.text "description"
    t.integer "unit"
    t.text "restriction"
    t.integer "pass_rate"
    t.integer "term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enrolments", force: :cascade do |t|
    t.string "student_ID"
    t.string "course_ID"
    t.integer "term"
    t.integer "marks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "program"
    t.string "plan"
    t.string "course_ID"
    t.string "course_type"
    t.integer "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "students", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "name"
    t.string "residency"
    t.string "qualification"
    t.string "program"
    t.string "plan"
    t.integer "year"
    t.string "expected_completion"
    t.string "english_exam"
    t.decimal "english_score"
  end

end
