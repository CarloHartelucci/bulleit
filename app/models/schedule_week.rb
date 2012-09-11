class ScheduleWeek < ActiveRecord::Base
  	attr_accessible :total_distance, :distance_type, :description, :athlete_id, :start_date

  	belongs_to :athlete
  	has_many :workouts
end
