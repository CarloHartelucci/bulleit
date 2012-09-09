class RunningTemplateWorkoutLeg < ActiveRecord::Base
  attr_accessible :running_template_workout_id, :distance, :distance_type, :pace_type, :repetitions, :recovery

  belongs_to :running_template_workout
end
