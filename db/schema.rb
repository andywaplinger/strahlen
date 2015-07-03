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

ActiveRecord::Schema.define(version: 20131129031622) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "short_name"
  end

  create_table "customers", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree

  create_table "email_subscribers", force: true do |t|
    t.string   "email"
    t.integer  "userId"
    t.string   "source"
    t.string   "details"
    t.string   "uniqueId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "email_subscribers", ["email"], name: "index_email_subscribers_on_email", unique: true, using: :btree
  add_index "email_subscribers", ["uniqueId"], name: "index_email_subscribers_on_uniqueId", unique: true, using: :btree

  create_table "product_attributes", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: true do |t|
    t.string   "caption"
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "primary_photo"
    t.boolean  "secondary_photo"
    t.boolean  "active"
    t.float    "crop_x"
    t.float    "crop_y"
    t.float    "crop_w"
    t.float    "crop_h"
  end

  create_table "product_lines", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "products", force: true do |t|
    t.string  "name"
    t.string  "sku"
    t.integer "price"
    t.boolean "in_stock"
    t.boolean "visible"
    t.integer "quantity"
    t.integer "category_id"
    t.integer "discount_price"
    t.integer "product_line_id"
    t.string  "description"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
