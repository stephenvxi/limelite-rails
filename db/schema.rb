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

ActiveRecord::Schema.define(version: 20190131074840) do

  create_table "auth_tokens", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "user_id"
    t.boolean  "expired",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "created_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "task_priorities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "level"
    t.string   "style"
  end

  create_table "task_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
    t.string   "style"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "assignee_id"
    t.integer  "status_id",   default: 1
    t.date     "due_date"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "priority_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.boolean  "is_admin",         default: false
    t.boolean  "is_company_admin", default: false
    t.integer  "created_by"
    t.integer  "company_id"
    t.string   "email",            default: "",    null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
