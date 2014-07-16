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

ActiveRecord::Schema.define(version: 20140716161305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.boolean  "finished",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id", using: :btree

  create_table "movements", force: true do |t|
    t.integer  "game_id"
    t.integer  "x_position"
    t.integer  "y_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movements", ["game_id"], name: "index_movements_on_game_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
