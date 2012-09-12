class RunningTemplateWorkout < ActiveRecord::Base
  attr_accessible :running_template_week_id, :total_distance, :distance_type, :description, :sequence

  belongs_to :running_template_week
  has_many :running_template_workout_legs
  default_scope :order => "running_template_workouts.sequence ASC"

  def generate(week, athlete, current_day)
  	workout = Workout.create!(athlete_id:athlete.id,
	  						  schedule_week_id: week.id,
							  description:self.description,
							  total_distance:self.total_distance,
							  distance_type:self.distance_type,
							  workout_type:1,
							  date: current_day)

  	self.running_template_workout_legs.each do |leg|
  		WorkoutLeg.create(workout_id:workout.id,
		 				  distance: leg.distance,
						  distance_type: leg.distance_type,
						  min_pace: athlete.training_paces.find_by_pace_type(leg.pace_type).min_pace,
						  max_pace:  athlete.training_paces.find_by_pace_type(leg.pace_type).max_pace,
						  repetitions: leg.repetitions,
						  recovery: leg.recovery)
  	end
  end
end
