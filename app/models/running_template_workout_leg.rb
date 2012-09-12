class RunningTemplateWorkoutLeg < ActiveRecord::Base
  attr_accessible :running_template_workout_id, :distance, :distance_type, :pace_type, :repetitions, :recovery, :sequence

  belongs_to :running_template_workout

  default_scope :order => "running_template_workout_legs.sequence ASC"
end
