class WorkoutLeg < ActiveRecord::Base
    attr_accessible :workout_id, :distance, :distance_type, :min_pace, :max_pace, :repetitions, :recovery
    belongs_to :workout
end
