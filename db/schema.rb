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

ActiveRecord::Schema.define(version: 20170710235430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "content"
    t.boolean  "is_valid",    default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "cource_slides", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_processes", force: :cascade do |t|
    t.string   "educable_type"
    t.integer  "educable_id"
    t.integer  "course_id"
    t.integer  "last_slide_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["course_id"], name: "index_course_processes_on_course_id", using: :btree
    t.index ["educable_type", "educable_id"], name: "index_course_processes_on_educable_type_and_educable_id", using: :btree
    t.index ["last_slide_id"], name: "index_course_processes_on_last_slide_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",                    comment: "course name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_tags", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_courses_tags_on_course_id", using: :btree
    t.index ["tag_id"], name: "index_courses_tags_on_tag_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_type",     default: 0, null: false
    t.integer  "points"
    t.string   "title"
    t.integer  "test_order_number"
    t.integer  "test_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "content"
    t.index ["test_id"], name: "index_questions_on_test_id", using: :btree
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.integer  "course_order_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["course_id"], name: "index_slides_on_course_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title",                   comment: "title of tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tests", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "test_id"
    t.index ["tag_id"], name: "index_tags_tests_on_tag_id", using: :btree
    t.index ["test_id"], name: "index_tags_tests_on_test_id", using: :btree
  end

  create_table "test_passings", force: :cascade do |t|
    t.string   "testable_type"
    t.integer  "testable_id"
    t.integer  "test_id"
    t.integer  "last_question_id"
    t.integer  "points_total",     default: 0,     null: false
    t.boolean  "is_finished",      default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["last_question_id"], name: "index_test_passings_on_last_question_id", using: :btree
    t.index ["test_id"], name: "index_test_passings_on_test_id", using: :btree
    t.index ["testable_type", "testable_id"], name: "index_test_passings_on_testable_type_and_testable_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tests_on_course_id", using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.string   "group_name",              comment: "visible name of group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",                                                            comment: "username"
    t.integer  "role",       default: 0,                                               comment: "role in the app"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "auth_token", default: "2463cc6b8cefe79dad6a8670d54c06db", null: false, comment: "auth token for user"
  end

  create_table "users_user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_group_id"], name: "index_users_user_groups_on_user_group_id", using: :btree
    t.index ["user_id"], name: "index_users_user_groups_on_user_id", using: :btree
  end

end
