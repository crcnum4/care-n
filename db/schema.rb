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

ActiveRecord::Schema.define(version: 20170312030957) do

  create_table "fitbit_oauths", force: :cascade do |t|
    t.integer "user_id"
    t.string  "authorization"
    t.string  "access_token"
  end

  create_table "fitbits", force: :cascade do |t|
    t.string   "profile",    default: "", null: false
    t.string   "activity",   default: "", null: false
    t.integer  "heartrate",  default: 0,  null: false
    t.string   "nutrition",  default: "", null: false
    t.integer  "sleep",      default: 0,  null: false
    t.integer  "weight",     default: 0,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "steps"
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "calories"
    t.string   "mealtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sleeps", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "weight"
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.integer  "total_inches"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
