class Workout < ActiveRecord::Base
  attr_accessible :summary, :details, :miles, :date, :athlete_id
  belongs_to :athlete

end
