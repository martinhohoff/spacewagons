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

ActiveRecord::Schema.define(version: 2019_02_06_185813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.string "destination"
    t.string "date"
    t.integer "gold_found"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expedition_item_1"
    t.integer "expedition_item_2"
    t.integer "expedition_item_3"
    t.index ["user_id"], name: "index_expeditions_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "laps", force: :cascade do |t|
    t.integer "lap_num"
    t.integer "combat_killers", default: [], array: true
    t.integer "combat_victims", default: [], array: true
    t.integer "crash_victims", default: [], array: true
    t.integer "positions", default: [], array: true
    t.integer "points", default: [], array: true
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_laps_on_race_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.integer "acc_mult"
    t.integer "spd_mult"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "serial"
    t.string "category"
    t.integer "condition"
    t.integer "price"
    t.integer "stat_acc"
    t.integer "stat_spd"
    t.integer "stat_man"
    t.integer "stat_atk"
    t.integer "stat_def"
    t.boolean "for_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "is_starter"
    t.integer "initial_price"
    t.boolean "is_equiped"
    t.string "rarity"
    t.index ["user_id"], name: "index_parts_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photourl"
    t.string "photo"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "map"
    t.integer "runners", default: [], array: true
    t.integer "champs_stats", default: [], array: true
    t.integer "final_results", default: [], array: true
    t.integer "runners_acc", default: [], array: true
    t.integer "runners_spd", default: [], array: true
    t.integer "runners_man", default: [], array: true
    t.integer "runners_atk", default: [], array: true
    t.integer "runners_def", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_ships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "coins"
    t.integer "score", default: 0
    t.integer "progress", default: 0
    t.integer "exp_left", default: 3
    t.string "pic"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expeditions", "users"
  add_foreign_key "images", "users"
  add_foreign_key "laps", "races"
  add_foreign_key "parts", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "players", "users"
  add_foreign_key "ships", "users"
end
