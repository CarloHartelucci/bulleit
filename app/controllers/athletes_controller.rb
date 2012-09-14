class AthletesController < ApplicationController
	def create
		@athlete = Athlete.new(name:params[:name],
							   fb_user_id:params[:fb_user_id],
							   email:params[:email],
							   user_name:params[:user_name],
							   access_token:params[:access_token])

		if @athlete.save
			@running_history = RunningHistory.new(athlete_id: @athlete.id,
												  distance_per_week: params[:distance_per_week],
												  distance_type: params[:distance_type], 
												  runs_per_week: params[:runs_per_week])
			if @running_history.save
				sign_in @athlete
				redirect_to new_history_url
				return
			end
		end
		render 'new'
	end

	def history
		@athlete = Athlete.find(current_user.id)
		@race_history = RaceHistory.new
	end

	def create_history
		@athlete = Athlete.find(current_user.id)

		params[:race].each do |sequence, race|
			if !race[:name].nil?
				RaceHistory.create(name: race[:name],
								   race_type: race[:race_type],
								   race_date: race[:race_date],
								   results: race[:results],
								   athlete_id: @athlete.id)
			end
		end
		redirect_to new_goal_url
	end

	def new_goal

	end

	def create_goal
		@athlete = Athlete.find(current_user.id)
		if @athlete.goal.nil?
			@athlete.goal.delete
		end
		
		@goal = Goal.new(name: params[:name],
						 race: params[:race],
						 date: params[:date],
						 race_type: params[:race_type],
						 goal_time: params[:goal_time],
						 athlete_id: @athlete.id)
		if !@goal.save
			render 'new_goal'
		else
			redirect_to root_path
		end
	end
end
