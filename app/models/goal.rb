class Goal < ActiveRecord::Base
  attr_accessible :race, :date, :goal_time, :athlete_id, :race_type, :name
  belongs_to :athlete
end
