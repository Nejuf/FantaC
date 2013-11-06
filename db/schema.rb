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

ActiveRecord::Schema.define(version: 20131106024338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: true do |t|
    t.string   "name",       default: "", null: false
    t.text     "desc",       default: "", null: false
    t.string   "start_date",              null: false
    t.string   "end_date",                null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contests", force: true do |t|
    t.string   "name",           default: "", null: false
    t.text     "desc",           default: "", null: false
    t.integer  "points_cap",     default: 0,  null: false
    t.integer  "entry_fee",      default: 0,  null: false
    t.integer  "payout_type_id",              null: false
    t.integer  "payout_amount"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "battle_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["battle_id"], name: "index_contests_on_battle_id", using: :btree
  add_index "contests", ["category_id"], name: "index_contests_on_category_id", using: :btree
  add_index "contests", ["entry_fee"], name: "index_contests_on_entry_fee", using: :btree
  add_index "contests", ["name"], name: "index_contests_on_name", using: :btree
  add_index "contests", ["payout_amount"], name: "index_contests_on_payout_amount", using: :btree
  add_index "contests", ["payout_type_id"], name: "index_contests_on_payout_type_id", using: :btree
  add_index "contests", ["user_id"], name: "index_contests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username",               default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
