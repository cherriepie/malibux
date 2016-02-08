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

ActiveRecord::Schema.define(version: 20160203063048) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roll_calls", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "rolls", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "server_id",    limit: 4
    t.string   "notes",        limit: 255
    t.string   "status",       limit: 255, default: "Unchecked"
    t.integer  "roll_call_id", limit: 4
    t.string   "server_name",  limit: 255
    t.string   "client_name",  limit: 255
  end

  add_index "rolls", ["roll_call_id"], name: "index_rolls_on_roll_call_id", using: :btree
  add_index "rolls", ["server_id"], name: "index_rolls_on_server_id", using: :btree

  create_table "servers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "client_id",   limit: 4
  end

  add_index "servers", ["client_id"], name: "index_servers_on_client_id", using: :btree

  add_foreign_key "rolls", "roll_calls"
  add_foreign_key "rolls", "servers"
  add_foreign_key "servers", "clients"
end
