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

ActiveRecord::Schema.define(version: 20170621142547) do

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id"
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.datetime "orderdate",  null: false
    t.integer  "pinwaiter",  null: false
    t.integer  "pinchef"
    t.datetime "attenddate"
    t.integer  "payvalue",   null: false
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "table_id"
    t.string   "address"
  end

  add_index "orders", ["table_id"], name: "index_orders_on_table_id"

  create_table "products", force: :cascade do |t|
    t.string   "name",                null: false
    t.text     "description"
    t.integer  "price",               null: false
    t.integer  "type_product_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "products", ["type_product_id"], name: "index_products_on_type_product_id"

  create_table "tables", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "total_products", force: :cascade do |t|
    t.integer  "ingredient_id", null: false
    t.integer  "product_id",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "total_products", ["ingredient_id"], name: "index_total_products_on_ingredient_id"
  add_index "total_products", ["product_id"], name: "index_total_products_on_product_id"

  create_table "type_products", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "name",                                           null: false
    t.string   "lastname",                                       null: false
    t.string   "docid",                                          null: false
    t.string   "username",                                       null: false
    t.integer  "pin",                    limit: 11,              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["pin"], name: "index_users_on_pin", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
