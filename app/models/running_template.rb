class RunningTemplate < ActiveRecord::Base
  attr_accessible :name, :distance, :distance_per_week, :distance_type, :level, :number_of_weeks, :runs_per_week
  has_many :running_template_weeks

  def generate_schedule(athlete, race_date, workout_day1, workout_day2, easy_days)
  	
  	start_date = calculate_start_date(race_date)
  	self.running_template_weeks.each do |week|
  		start_of_week = start_date + 7 * week.sequence
  		(0..7).each do |wday|
  			current_day = start_of_week + wday
  			if current_day.wday == workout_day1
  				workout_template = week.running_template_workouts[0]
  				workout = Workout.new(athlete_id:athlete.id,
  									  description:workout_template.description,
  									  total_distance:workout_template.total_distance,
  									  distance_type:workout_template.distance_type,
  									  workout_type:1,
  									  date: current_day)
  				workout.save
  				workout_template.running_template_workout_legs.each do |leg_template|
  					leg = WorkoutLeg.new(workout_id: workout.id,
  										 distance: leg_template.distance,
  										 distance_type: leg_template.distance_type,
  										 min_pace: athlete.training_paces.find_by_pace_type(leg_template.pace_type).min_pace,
  										 max_pace:  athlete.training_paces.find_by_pace_type(leg_template.pace_type).max_pace,
  										 repetitions: leg_template.repetitions,
  										 recovery: leg_template.recovery)
  					leg.save
  				end
  			elsif current_day.wday == workout_day2
  				workout_template = week.running_template_workouts[1]
  				workout = Workout.new(athlete_id:athlete.id,
  									  description:workout_template.description,
  									  total_distance:workout_template.total_distance,
  									  distance_type:workout_template.distance_type,
  									  workout_type:1,
  									  date: current_day)
  				workout.save
  				workout_template.running_template_workout_legs.each do |leg_template|
  					leg = WorkoutLeg.new(workout_id: workout.id,
  										 distance: leg_template.distance,
  										 distance_type: leg_template.distance_type,
  										 min_pace: athlete.training_paces.find_by_pace_type(leg_template.pace_type).min_pace,
  										 max_pace:  athlete.training_paces.find_by_pace_type(leg_template.pace_type).max_pace,
  										 repetitions: leg_template.repetitions,
  										 recovery: leg_template.recovery)
  					leg.save
  				end
  			elsif !easy_days[current_day.wday].nil?
  				workout = Workout.new(athlete_id:athlete.id,
  									  description:"Easy Run",
  									  total_distance: (week.total_distance - week.running_template_workouts.sum(:total_distance)) * easy_days[current_day.wday],
  									  distance_type: week.distance_type,
  									  workout_type: 2,
  									  date: current_day)
  				workout.save
  			end

  				
  		end
  	end

  end

  private 
  	def calculate_start_date(date_of_race)
  		# start on closest Monday
  		start_date = date_of_race - self.number_of_weeks*7
  		if start_date.wday > 4
  			start_date += 8-start_date.wday
  		else
  			start_date -= start_date.wday - 1
  		end
  	end
end
