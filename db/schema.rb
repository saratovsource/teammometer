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

ActiveRecord::Schema.define(version: 20140421191116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "interview_forms", force: true do |t|
    t.integer  "respondent_id"
    t.integer  "survey_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "interview_forms", ["respondent_id"], name: "index_interview_forms_on_respondent_id", using: :btree
  add_index "interview_forms", ["survey_id"], name: "index_interview_forms_on_survey_id", using: :btree

  create_table "respondents", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "respondents", ["survey_id"], name: "index_respondents_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.integer  "interviewer_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "attraction_question"
    t.text     "referention_question"
    t.text     "personal_qualities_question"
  end

  add_index "surveys", ["interviewer_id"], name: "index_surveys_on_interviewer_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
