class ScheduleController < ApplicationController

	before_filter :signed_in_athlete

	def current_week
		@current_week = current_user.current_week
		@base_path = request.fullpath.split('?')[0]
		@goal = current_user.goal
		@summary_miles = 0
		@summary_workouts = 0
		@current_week.each do |w|
			@summary_miles += w.miles
			@summary_workouts += 1
		end

		if params['active'].nil?
			@active_day = current_user.today
		else
			@active_day = Workout.find(params['active'])
		end
	end

	protected
		def signed_in_athlete
			if !signed_in? 
	        	store_location
	        	redirect_to '/signin', notice: "Please sign in."
		    end
		end
end
