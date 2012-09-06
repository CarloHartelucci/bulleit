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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120905205310) do

  create_table "athletes", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "user_name"
    t.string   "fb_user_id"
    t.string   "access_token"
    t.string   "remember_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "athletes", ["fb_user_id"], :name => "index_athletes_on_fb_user_id"
  add_index "athletes", ["remember_token"], :name => "index_athletes_on_remember_token"

  create_table "goals", :force => true do |t|
    t.integer  "athlete_id"
    t.string   "race"
    t.decimal  "distance"
    t.date     "date"
    t.string   "goal_time"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "goals", ["athlete_id"], :name => "index_goals_on_athlete_id"

  create_table "workouts", :force => true do |t|
    t.string   "summary"
    t.string   "details"
    t.integer  "miles"
    t.date     "date"
    t.integer  "athlete_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "workouts", ["athlete_id"], :name => "index_workouts_on_athlete_id"

end
