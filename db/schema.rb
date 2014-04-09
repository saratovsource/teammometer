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

ActiveRecord::Schema.define(version: 20140409200738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "survey_participants", force: true do |t|
    t.string   "name"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_participants", ["survey_id"], name: "index_survey_participants_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.integer  "interviewer_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["interviewer_id"], name: "index_surveys_on_interviewer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "state"
    t.string   "password_digest"
    t.string   "confirmation_token"
    t.string   "reset_password_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
