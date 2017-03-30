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

ActiveRecord::Schema.define(version: 20170329135649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "description"
    t.integer  "programmer_id"
    t.integer  "client_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "index_projects_on_client_id", using: :btree
    t.index ["programmer_id"], name: "index_projects_on_programmer_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.date     "initial_date"
    t.date     "final_date"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_schedules_on_project_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id", using: :btree
  end

  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "programmers"
  add_foreign_key "schedules", "projects"
  add_foreign_key "tasks", "schedules"
end
