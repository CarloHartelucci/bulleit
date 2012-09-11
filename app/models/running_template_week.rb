class RunningTemplateWeek < ActiveRecord::Base
  attr_accessible :running_template_id, :total_distance, :distance_type, :sequence, :description

  belongs_to :running_template
  has_many :running_template_workouts

  def generate(athlete, start_of_week, weekly_schedule)
  	week = ScheduleWeek.new(athlete_id: athlete.id,
  							total_distance: self.total_distance,
  							distance_type: self.distance_type,
  							description: self.description,
  							start_date:start_of_week)
  	week.save
  	(0..6).each do |wday|
  		current_day = start_of_week + wday
  		if weekly_schedule[current_day.wday] == "workout1"
  			running_template_workouts[0].generate(week, athlete, current_day)
  		elsif weekly_schedule[current_day.wday] == "workout2"
  			running_template_workouts[1].generate(week, athlete, current_day)
  		elsif weekly_schedule[current_day.wday] == "off"
  			workout = Workout.new(athlete_id:athlete.id,
  								  schedule_week_id: week.id,
  								  workout_type:3,
  								  date:current_day,
  								  description:"Off Day")
  			workout.save
  		else
  			workout = Workout.new(athlete_id:athlete.id,
  								  schedule_week_id: week.id,
  								  workout_type:2,
  								  total_distance: (week.total_distance - self.running_template_workouts.sum(:total_distance)) * weekly_schedule[current_day.wday],
  								  date:current_day,
  								  description:"Easy Day")
  			workout.save
  		end
  	end
  end
end
