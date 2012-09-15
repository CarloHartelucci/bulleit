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
		create_training_paces(@athlete)


		@goal = Goal.new(name: params[:name],
						 race: params[:race],
						 date: params[:date],
						 race_type: params[:race_type],
						 goal_time: params[:goal_time],
						 athlete_id: @athlete.id)
		if !@goal.save
			render 'new_goal'
		else
			template = RunningTemplate.first
			template.generate(@athlete, @goal.date, [ 0.40, "off", "workout1", 0.30, "off", "workout2", 0.30])
			redirect_to root_path
		end
	end

	private
		def create_training_paces(athlete)
			TrainingPace.create(athlete_id:athlete.id,
					pace_type:0,
					min_pace:"7:45",
					max_pace:"8:30")
			TrainingPace.create(athlete_id:athlete.id,
								pace_type:1,
								min_pace:"7:03")
			TrainingPace.create(athlete_id:athlete.id,
								pace_type:2,
								min_pace:"6:40")
			TrainingPace.create(athlete_id:athlete.id,
								pace_type:3,
								min_pace:"6:10")
		end
end
