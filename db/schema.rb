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

ActiveRecord::Schema.define(version: 20170113035832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.text     "social_media_link", default: [],              array: true
    t.string   "address"
    t.string   "contact"
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "giveaways", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "description"
    t.string   "prize_name"
    t.string   "prize_image"
    t.string   "terms_and_condition"
    t.string   "winner_message"
    t.string   "consolation_message"
    t.string   "link"
    t.integer  "num_winner"
    t.integer  "num_backup"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["company_id"], name: "index_giveaways_on_company_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "giveaway_id"
    t.string   "name"
    t.string   "email"
    t.integer  "points"
    t.string   "referral_identification"
    t.string   "contact"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["giveaway_id"], name: "index_participants_on_giveaway_id", using: :btree
  end

  create_table "referrals", force: :cascade do |t|
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["participant_id"], name: "index_referrals_on_participant_id", using: :btree
  end

  create_table "winners", force: :cascade do |t|
    t.integer  "giveaway_id"
    t.integer  "winners"
    t.integer  "backup_winners", default: [],              array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["giveaway_id"], name: "index_winners_on_giveaway_id", using: :btree
  end

end
