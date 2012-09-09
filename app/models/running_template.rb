class RunningTemplate < ActiveRecord::Base
  attr_accessible :name, :distance, :distance_per_week, :distance_type, :level, :number_of_weeks, :runs_per_week
  has_many :running_template_weeks

end
