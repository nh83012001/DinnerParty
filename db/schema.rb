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

ActiveRecord::Schema.define(version: 20171025130956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alcohols", force: :cascade do |t|
    t.string   "alcohol_type"
    t.integer  "dinner_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "dinner_id"
    t.integer  "userrecipe_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "course_type"
    t.string   "alcohol_type"
  end

  create_table "dinners", force: :cascade do |t|
    t.string   "location"
    t.integer  "host_id"
    t.string   "name"
    t.string   "attire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
  end

  create_table "drinks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dinner_id"
    t.string   "drink_type"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dinner_id"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "ingredients"
    t.string   "instructions"
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

  create_table "userrecipes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
