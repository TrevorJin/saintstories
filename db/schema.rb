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

ActiveRecord::Schema.define(version: 20170118053410) do

  create_table "saints", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "feast_day"
    t.datetime "birth_date"
    t.integer  "birth_accuracy"
    t.datetime "death_date"
    t.integer  "death_accuracy"
    t.string   "birth_location"
    t.string   "death_location"
    t.datetime "beatification_date"
    t.datetime "canonization_date"
    t.boolean  "pope",                 default: false
    t.boolean  "cardinal",             default: false
    t.boolean  "bishop",               default: false
    t.boolean  "priest",               default: false
    t.boolean  "religious",            default: false
    t.boolean  "lay",                  default: false
    t.boolean  "martyr",               default: false
    t.boolean  "founder",              default: false
    t.boolean  "mystic",               default: false
    t.boolean  "doctor_of_the_church", default: false
    t.boolean  "early_church_father",  default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "birth_latitude"
    t.float    "birth_longitude"
    t.float    "death_latitude"
    t.float    "death_longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end