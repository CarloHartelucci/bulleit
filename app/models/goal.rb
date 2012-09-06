class Goal < ActiveRecord::Base
  attr_accessible :race, :date, :goal_time, :athlete_id, :distance, :name
  belongs_to :athlete
end
