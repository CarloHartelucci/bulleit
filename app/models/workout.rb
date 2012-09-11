class Workout < ActiveRecord::Base
  attr_accessible :workout_type, :description, :total_distance, :distance_type, :date, :athlete_id
  belongs_to :athlete
  has_many :workout_legs

end
