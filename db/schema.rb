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

ActiveRecord::Schema.define(version: 20160323122306) do

  create_table "basics", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "last_name",                  limit: 255
    t.string   "middle_name",                limit: 255
    t.date     "birthday"
    t.integer  "enrllment_form_instance_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "skype",                       limit: 255
    t.string   "phone",                       limit: 255
    t.string   "email",                       limit: 255
    t.integer  "enrollment_form_instance_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "emergencies", force: :cascade do |t|
    t.string   "person",                      limit: 255
    t.string   "info",                        limit: 255
    t.integer  "enrollment_form_instance_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "enrollment_form_instances", force: :cascade do |t|
    t.integer  "enrollment_form_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",            limit: 4
  end

  add_index "enrollment_form_instances", ["user_id"], name: "index_enrollment_form_instances_on_user_id", using: :btree

  create_table "enrollment_form_sections", force: :cascade do |t|
    t.integer  "enrollment_form_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "enrollment_forms", force: :cascade do |t|
    t.integer  "grade_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "dscription",                limit: 255
    t.string   "certificate_template_path", limit: 255
    t.integer  "school_id",                 limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "impersonations", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "enrollments_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "impersonator_id", limit: 4, null: false
    t.integer  "user_id",         limit: 4, null: false
  end

  add_index "impersonations", ["impersonator_id"], name: "index_impersonations_on_impersonator_id", using: :btree
  add_index "impersonations", ["user_id"], name: "index_impersonations_on_user_id", using: :btree

  create_table "medications", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "notes",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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
    t.string   "phone",       limit: 255
    t.string   "avatar",      limit: 255
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string   "topic",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "child_id",   limit: 4, null: false
    t.integer  "parent_id",  limit: 4, null: false
  end

  add_index "relationships", ["child_id"], name: "index_relationships_on_child_id", using: :btree
  add_index "relationships", ["parent_id"], name: "index_relationships_on_parent_id", using: :btree

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

  add_foreign_key "impersonations", "users"
  add_foreign_key "impersonations", "users", column: "impersonator_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "relationships", "users", column: "child_id"
  add_foreign_key "relationships", "users", column: "parent_id"
end
