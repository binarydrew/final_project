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

ActiveRecord::Schema.define(version: 20130806165905) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "lang_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phrases", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "posted_lang_id"
    t.integer  "trans_lang_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phrases", ["posted_lang_id"], name: "index_phrases_on_posted_lang_id"
  add_index "phrases", ["trans_lang_id"], name: "index_phrases_on_trans_lang_id"
  add_index "phrases", ["user_id"], name: "index_phrases_on_user_id"

  create_table "translations", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "phrase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "translations", ["parent_id"], name: "index_translations_on_parent_id"
  add_index "translations", ["phrase_id"], name: "index_translations_on_phrase_id"
  add_index "translations", ["user_id"], name: "index_translations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "language_id"
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["language_id"], name: "index_users_on_language_id"

  create_table "votes", force: true do |t|
    t.integer  "vote_value"
    t.integer  "user_id"
    t.integer  "translation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["translation_id"], name: "index_votes_on_translation_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
