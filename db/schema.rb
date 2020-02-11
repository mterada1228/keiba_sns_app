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

ActiveRecord::Schema.define(version: 20200211022505) do

  create_table "hosemarks", force: :cascade do |t|
    t.string "hose1_mark"
    t.string "hose2_mark"
    t.string "hose3_mark"
    t.string "hose4_mark"
    t.string "hose5_mark"
    t.string "hose6_mark"
    t.string "hose7_mark"
    t.string "hose8_mark"
    t.string "hose9_mark"
    t.string "hose10_mark"
    t.string "hose11_mark"
    t.string "hose12_mark"
    t.string "hose13_mark"
    t.string "hose14_mark"
    t.string "hose15_mark"
    t.string "hose16_mark"
    t.string "hose17_mark"
    t.string "hose18_mark"
    t.integer "micropost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_hosemarks_on_micropost_id"
  end

  create_table "kaimes", force: :cascade do |t|
    t.string "baken_type"
    t.string "buy_type"
    t.string "first_hoses"
    t.string "second_hoses"
    t.string "third_hoses"
    t.integer "betting"
    t.integer "micropost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["micropost_id"], name: "index_kaimes_on_micropost_id"
  end

  create_table "menus", force: :cascade do |t|
    t.date "today_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_microposts_on_race_id"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "place"
    t.integer "round"
    t.string "race_name"
    t.string "cource_type"
    t.integer "cource_length"
    t.integer "menu_id"
    t.string "hose1_name"
    t.integer "hose1_gate_number"
    t.string "hose1_gate_color"
    t.string "hose1_number"
    t.string "hose2_name"
    t.integer "hose2_gate_number"
    t.string "hose2_gate_color"
    t.string "hose2_number"
    t.string "hose3_name"
    t.integer "hose3_gate_number"
    t.string "hose3_gate_color"
    t.string "hose3_number"
    t.string "hose4_name"
    t.integer "hose4_gate_number"
    t.string "hose4_gate_color"
    t.string "hose4_number"
    t.string "hose5_name"
    t.integer "hose5_gate_number"
    t.string "hose5_gate_color"
    t.string "hose5_number"
    t.string "hose6_name"
    t.integer "hose6_gate_number"
    t.string "hose6_gate_color"
    t.string "hose6_number"
    t.string "hose7_name"
    t.integer "hose7_gate_number"
    t.string "hose7_gate_color"
    t.string "hose7_number"
    t.string "hose8_name"
    t.integer "hose8_gate_number"
    t.string "hose8_gate_color"
    t.string "hose8_number"
    t.string "hose9_name"
    t.integer "hose9_gate_number"
    t.string "hose9_gate_color"
    t.string "hose9_number"
    t.string "hose10_name"
    t.integer "hose10_gate_number"
    t.string "hose10_gate_color"
    t.string "hose10_number"
    t.string "hose11_name"
    t.integer "hose11_gate_number"
    t.string "hose11_gate_color"
    t.string "hose11_number"
    t.string "hose12_name"
    t.integer "hose12_gate_number"
    t.string "hose12_gate_color"
    t.string "hose12_number"
    t.string "hose13_name"
    t.integer "hose13_gate_number"
    t.string "hose13_gate_color"
    t.string "hose13_number"
    t.string "hose14_name"
    t.integer "hose14_gate_number"
    t.string "hose14_gate_color"
    t.string "hose14_number"
    t.string "hose15_name"
    t.integer "hose15_gate_number"
    t.string "hose15_gate_color"
    t.string "hose15_number"
    t.string "hose16_name"
    t.integer "hose16_gate_number"
    t.string "hose16_gate_color"
    t.string "hose16_number"
    t.string "hose17_name"
    t.integer "hose17_gate_number"
    t.string "hose17_gate_color"
    t.string "hose17_number"
    t.string "hose18_name"
    t.integer "hose18_gate_number"
    t.string "hose18_gate_color"
    t.string "hose18_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_races_on_menu_id"
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
