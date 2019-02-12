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

ActiveRecord::Schema.define(version: 20171213061231) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "saint_photos", force: :cascade do |t|
    t.string "photo"
    t.string "photo_caption"
    t.string "photo_description"
    t.string "photo_alternative_text"
    t.integer "width"
    t.integer "height"
    t.integer "saint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "photo_priority"
    t.index ["saint_id", "created_at"], name: "index_saint_photos_on_saint_id_and_created_at"
    t.index ["saint_id"], name: "index_saint_photos_on_saint_id"
  end

  create_table "saints", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "feast_day"
    t.datetime "birth_date"
    t.integer "birth_accuracy"
    t.datetime "death_date"
    t.integer "death_accuracy"
    t.string "birth_location"
    t.string "death_location"
    t.datetime "beatification_date"
    t.datetime "canonization_date"
    t.boolean "pope", default: false
    t.boolean "cardinal", default: false
    t.boolean "bishop", default: false
    t.boolean "priest", default: false
    t.boolean "religious", default: false
    t.boolean "lay", default: false
    t.boolean "martyr", default: false
    t.boolean "founder", default: false
    t.boolean "mystic", default: false
    t.boolean "doctor_of_the_church", default: false
    t.boolean "early_church_father", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "birth_latitude"
    t.float "birth_longitude"
    t.float "death_latitude"
    t.float "death_longitude"
    t.string "slug"
    t.integer "beatification_accuracy"
    t.integer "canonization_accuracy"
    t.boolean "royalty", default: false
    t.text "short_description"
    t.text "long_description"
    t.string "avatar"
    t.string "avatar_caption"
    t.string "avatar_description"
    t.string "avatar_alternative_text"
    t.integer "fame_level"
    t.boolean "published", default: false
    t.integer "title"
    t.index ["slug"], name: "index_saints_on_slug", unique: true
  end

  create_table "timeline_events", force: :cascade do |t|
    t.string "image"
    t.string "image_caption"
    t.string "image_description"
    t.string "image_alternative_text"
    t.text "event_description"
    t.integer "saint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_priority"
    t.string "event_title"
    t.string "event_time"
    t.index ["saint_id", "created_at"], name: "index_timeline_events_on_saint_id_and_created_at"
    t.index ["saint_id"], name: "index_timeline_events_on_saint_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "approved", default: false
    t.datetime "approved_at"
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "written_works", force: :cascade do |t|
    t.string "title"
    t.date "publication_date"
    t.string "description"
    t.integer "saint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "publication_accuracy"
    t.index ["saint_id", "created_at"], name: "index_written_works_on_saint_id_and_created_at"
    t.index ["saint_id"], name: "index_written_works_on_saint_id"
  end

end
