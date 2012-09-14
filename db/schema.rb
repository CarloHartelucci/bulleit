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

ActiveRecord::Schema.define(:version => 20120914215035) do

  create_table "athletes", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "user_name"
    t.string   "fb_user_id"
    t.string   "access_token"
    t.string   "remember_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.decimal  "vdot"
  end

  add_index "athletes", ["fb_user_id"], :name => "index_athletes_on_fb_user_id"
  add_index "athletes", ["remember_token"], :name => "index_athletes_on_remember_token"

  create_table "goals", :force => true do |t|
    t.integer  "athlete_id"
    t.string   "race"
    t.date     "date"
    t.string   "goal_time"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "race_type"
  end

  add_index "goals", ["athlete_id"], :name => "index_goals_on_athlete_id"

  create_table "race_histories", :force => true do |t|
    t.integer  "athlete_id"
    t.integer  "race_type"
    t.date     "race_date"
    t.string   "results"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "running_histories", :force => true do |t|
    t.integer  "athlete_id"
    t.integer  "distance_per_week"
    t.integer  "distance_type"
    t.integer  "runs_per_week"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "running_template_weeks", :force => true do |t|
    t.integer  "running_template_id"
    t.integer  "sequence"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "distance_percent"
  end

  add_index "running_template_weeks", ["running_template_id"], :name => "index_running_template_weeks_on_running_template_id"

  create_table "running_template_workout_legs", :force => true do |t|
    t.integer  "running_template_workout_id"
    t.integer  "distance"
    t.integer  "distance_type"
    t.integer  "pace_type"
    t.integer  "repetitions"
    t.integer  "recovery"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "sequence"
  end

  add_index "running_template_workout_legs", ["running_template_workout_id"], :name => "running_template_workout_leg_index"

  create_table "running_template_workouts", :force => true do |t|
    t.integer  "running_template_week_id"
    t.integer  "total_distance"
    t.integer  "distance_type"
    t.text     "description"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "sequence"
  end

  add_index "running_template_workouts", ["running_template_week_id"], :name => "running_template_workout_week_index"

  create_table "running_templates", :force => true do |t|
    t.string   "name"
    t.integer  "distance"
    t.integer  "distance_per_week"
    t.integer  "distance_type"
    t.integer  "level"
    t.integer  "number_of_weeks"
    t.integer  "runs_per_week"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "schedule_weeks", :force => true do |t|
    t.date     "start_date"
    t.integer  "total_distance"
    t.integer  "distance_type"
    t.text     "description"
    t.integer  "athlete_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "schedule_weeks", ["athlete_id"], :name => "index_schedule_weeks_on_athlete_id"

  create_table "training_paces", :force => true do |t|
    t.integer  "pace_type"
    t.string   "min_pace"
    t.string   "max_pace"
    t.integer  "athlete_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "training_paces", ["athlete_id"], :name => "index_training_paces_on_athlete_id"

  create_table "workout_legs", :force => true do |t|
    t.integer  "workout_id"
    t.integer  "distance"
    t.integer  "distance_type"
    t.string   "min_pace"
    t.string   "max_pace"
    t.integer  "repetitions"
    t.integer  "recovery"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "workout_legs", ["workout_id"], :name => "index_workout_legs_on_workout_id"

  create_table "workouts", :force => true do |t|
    t.integer  "workout_type"
    t.string   "description"
    t.integer  "total_distance"
    t.integer  "distance_type"
    t.date     "date"
    t.integer  "athlete_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "schedule_week_id"
  end

  add_index "workouts", ["athlete_id"], :name => "index_workouts_on_athlete_id"
  add_index "workouts", ["schedule_week_id"], :name => "index_workouts_on_schedule_week_id"

end
