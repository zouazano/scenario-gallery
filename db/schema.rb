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

ActiveRecord::Schema.define(version: 20200927081411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "scenario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "scenario_id"], name: "index_bookmarks_on_player_id_and_scenario_id", unique: true
    t.index ["player_id"], name: "index_bookmarks_on_player_id"
    t.index ["scenario_id"], name: "index_bookmarks_on_scenario_id"
  end

  create_table "follow_relationships", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_follow_relationships_on_follow_id"
    t.index ["player_id", "follow_id"], name: "index_follow_relationships_on_player_id_and_follow_id", unique: true
    t.index ["player_id"], name: "index_follow_relationships_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "nickname"
    t.string "image"
    t.integer "writer_id"
  end

  create_table "review_relationships", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "review_id"], name: "index_review_relationships_on_player_id_and_review_id", unique: true
    t.index ["player_id"], name: "index_review_relationships_on_player_id"
    t.index ["review_id"], name: "index_review_relationships_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "scenario_id", null: false
    t.float "score"
    t.text "content"
    t.boolean "spoiler"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "scenario_id"], name: "index_reviews_on_player_id_and_scenario_id", unique: true
    t.index ["player_id"], name: "index_reviews_on_player_id"
    t.index ["scenario_id"], name: "index_reviews_on_scenario_id"
  end

  create_table "scenario_writers", force: :cascade do |t|
    t.bigint "scenario_id"
    t.bigint "writer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scenario_id"], name: "index_scenario_writers_on_scenario_id"
    t.index ["writer_id"], name: "index_scenario_writers_on_writer_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string "title"
    t.integer "player_number"
    t.string "scenario_link"
    t.boolean "gm"
    t.integer "price"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "play_time"
    t.string "tool"
  end

  create_table "writers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
  end

  add_foreign_key "follow_relationships", "players"
  add_foreign_key "follow_relationships", "players", column: "follow_id"
end
