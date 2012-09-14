class RunningHistory < ActiveRecord::Base
  attr_accessible :athlete_id, :distance_per_week, :distance_type, :runs_per_week
  belongs_to :athlete
end
