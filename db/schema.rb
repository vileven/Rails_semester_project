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

ActiveRecord::Schema.define(version: 20161226114909) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "answerer_id"
    t.integer  "question_id"
    t.integer  "rating",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_likes_on_answer_id"
    t.index ["user_id", "answer_id"], name: "index_likes_on_user_id_and_answer_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "answers_count", default: 0
    t.integer  "author_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["author_id", "created_at"], name: "index_questions_on_author_id_and_created_at"
  end

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "tag_id"
    t.index ["question_id"], name: "index_questions_tags_on_question_id"
    t.index ["tag_id"], name: "index_questions_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "question_count", default: 0
    t.index ["question_count"], name: "index_tags_on_question_count"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar"
    t.string   "about_me"
    t.boolean  "admin",           default: false
    t.integer  "question_count",  default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["question_count"], name: "index_users_on_question_count"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
