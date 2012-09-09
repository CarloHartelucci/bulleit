class RunningTemplateWorkout < ActiveRecord::Base
  attr_accessible :running_template_week_id, :total_distance, :distance_type, :description

  belongs_to :running_template_week
  has_many :running_template_workout_legs
end
