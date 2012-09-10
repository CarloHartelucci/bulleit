class TrainingPace < ActiveRecord::Base
  attr_accessible :pace_type, :min_pace, :max_pace, :athlete_id
  belongs_to :athlete
end
