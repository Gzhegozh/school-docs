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

ActiveRecord::Schema.define(version: 20160321202324) do

  create_table "column_instances", force: :cascade do |t|
    t.integer  "tab_instance_id", limit: 4
    t.integer  "column_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "columns", force: :cascade do |t|
    t.integer  "tab_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "grade_id",    limit: 4
    t.datetime "finished_at"
    t.integer  "mark",        limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "dscription",                limit: 255
    t.string   "certificate_template_path", limit: 255
    t.integer  "school_id",                 limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "grades_tabs", id: false, force: :cascade do |t|
    t.integer "grade_id", limit: 4
    t.integer "tab_id",   limit: 4
  end

  add_index "grades_tabs", ["grade_id", "tab_id"], name: "grades_tabs_index", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "subject",     limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "sender_id",   limit: 4
    t.integer  "receiver_id", limit: 4
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "last_name",   limit: 255
    t.string   "middle_name", limit: 255
    t.date     "birthday"
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "school_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "school_group_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tab_instances", force: :cascade do |t|
    t.integer  "enrollment_id", limit: 4
    t.integer  "tab_id",        limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tabs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
