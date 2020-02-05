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

ActiveRecord::Schema.define(version: 20200205212217) do

  create_table "menus", force: :cascade do |t|
    t.date "today_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "place"
    t.integer "round"
    t.string "race_name"
    t.string "cource_type"
    t.integer "cource_length"
    t.string "hose_name1"
    t.string "hose_name2"
    t.string "hose_name3"
    t.string "hose_name4"
    t.string "hose_name5"
    t.string "hose_name6"
    t.string "hose_name7"
    t.string "hose_name8"
    t.string "hose_name9"
    t.string "hose_name10"
    t.string "hose_name11"
    t.string "hose_name12"
    t.string "hose_name13"
    t.string "hose_name14"
    t.string "hose_name15"
    t.string "hose_name16"
    t.string "hose_name17"
    t.string "hose_name18"
    t.integer "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.boolean "active"
    t.string "activate_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

end
