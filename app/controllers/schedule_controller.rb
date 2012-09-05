class ScheduleController < ApplicationController

	before_filter :signed_in_athlete

	def current_week
		@current_week = current_user.current_week
		@today = current_user.today
	end

	protected
		def signed_in_athlete
			if !signed_in? 
	        	store_location
	        	redirect_to '/signin', notice: "Please sign in."
		    end
		end
end
