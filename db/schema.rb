# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_15_174647) do
  create_table "beans", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.text "tasting_notes"
    t.integer "roaster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "roasted_at"
    t.index ["roaster_id"], name: "index_beans_on_roaster_id"
  end

  create_table "recipe_beans", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "bean_id", null: false
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_recipe_beans_on_bean_id"
    t.index ["recipe_id"], name: "index_recipe_beans_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "instructions"
    t.integer "difficulty", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "roasters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "photo_url"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "beans", "roasters"
  add_foreign_key "recipe_beans", "beans"
  add_foreign_key "recipe_beans", "recipes"
  add_foreign_key "recipes", "users"
end
