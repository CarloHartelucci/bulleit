class RunningTemplateWeek < ActiveRecord::Base
  attr_accessible :running_template_id, :total_distance, :distance_type, :sequence, :description

  belongs_to :running_template
  has_many :running_template_workouts
end
