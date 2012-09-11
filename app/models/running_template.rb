class RunningTemplate < ActiveRecord::Base
  attr_accessible :name, :distance, :distance_per_week, :distance_type, :level, :number_of_weeks, :runs_per_week
  has_many :running_template_weeks

  def generate(athlete, race_date, weekly_schedule)
  	
  	start_date = calculate_start_date(race_date)
  	self.running_template_weeks.each do |week|
  		start_of_week = start_date + 7 * week.sequence
  		week.generate(athlete, start_of_week, weekly_schedule)
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
