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

ActiveRecord::Schema.define(version: 20160312121212) do

  create_table "authors", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "boolean_questions", force: :cascade do |t|
    t.boolean  "answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "survey_question_id"
  end

  create_table "dropdown_questions", force: :cascade do |t|
    t.string   "answer"
    t.integer  "survey_question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "long_answer_questions", force: :cascade do |t|
    t.text     "answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "survey_question_id"
  end

  create_table "short_answer_questions", force: :cascade do |t|
    t.string   "answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "survey_question_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string   "text"
    t.string   "question_type"
    t.boolean  "required"
    t.integer  "survey_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "answer_options"
    t.integer  "position"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.boolean  "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
