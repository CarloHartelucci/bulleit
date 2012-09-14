class ScheduleController < ApplicationController

	before_filter :signed_in_athlete

	def schedule
		@athlete = Athlete.first
	end

	protected
		def signed_in_athlete
			if !signed_in? 
	        	store_location
	        	redirect_to '/login', notice: "Please sign in."
		    end
		end
end
