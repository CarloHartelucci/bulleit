class Workout < ActiveRecord::Base
  attr_accessible :workout_type, :description, :total_distance, :distance_type, :date, :athlete_id, :schedule_week_id
  belongs_to :athlete
  belongs_to :week
  has_many :workout_legs

end
