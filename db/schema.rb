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

ActiveRecord::Schema.define(version: 20151030071354) do

  create_table "listing_analytics", force: :cascade do |t|
    t.integer  "listing_id", limit: 4
    t.integer  "view_count", limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "listing_analytics_locations", force: :cascade do |t|
    t.integer  "listing_analytic_id", limit: 4
    t.string   "ip",                  limit: 255
    t.float    "longitude",           limit: 24
    t.float    "latitude",            limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "owner_id",                   limit: 4
    t.string   "address",                    limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.float    "longitude",                  limit: 24
    t.float    "latitude",                   limit: 24
    t.decimal  "price",                                  precision: 8, scale: 2
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.integer  "status",                     limit: 4,                           default: 0
    t.string   "listing_image_file_name",    limit: 255
    t.string   "listing_image_content_type", limit: 255
    t.integer  "listing_image_file_size",    limit: 4
    t.datetime "listing_image_updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "seller_id",  limit: 4
    t.integer  "buyer_id",   limit: 4
    t.integer  "listing_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.boolean  "is_admin",                           default: false
    t.boolean  "is_buyer",                           default: false
    t.boolean  "is_seller",                          default: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
