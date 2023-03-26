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

ActiveRecord::Schema.define(version: 2023_03_26_152323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.boolean "explicit_content"
    t.string "performance_day"
    t.integer "number_of_performances"
    t.integer "festival_appearances"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "festival_id"
    t.index ["festival_id"], name: "index_artists_on_festival_id"
  end

  create_table "festivals", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.boolean "kid_friendly"
    t.integer "ticket_price"
    t.string "dates"
    t.boolean "rv_hookup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artists", "festivals"
end
