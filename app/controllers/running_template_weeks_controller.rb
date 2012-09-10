class RunningTemplateWeeksController < ApplicationController
	include RunningTemplateWeekHelper
	def edit
		@template, @week = get_week(params[:template_id], params[:id])
	end

	def update
		@errors = []
		@template, @week = get_week(params[:template_id], params[:id])
		@week.total_distance = params[:week][:total_distance]
		@week.description = params[:week][:description]
		if @week.save
			params[:workout].each do |id, workout|
				if RunningTemplateWorkout.exists?(id)
					@workout = RunningTemplateWorkout.find(id)
					@workout.total_distance = workout[:total_distance]
					@workout.description = workout[:description]
					if @workout.save
						workout[:legs].each do |id, leg|
							if RunningTemplateWorkoutLeg.exists?(id)
								@leg = RunningTemplateWorkoutLeg.find(id)
								@leg.repetitions = leg[:repetitions]
								@leg.distance = leg[:distance]
								@leg.distance_type = leg[:distance_type]
								@leg.recovery = leg[:recovery]
								if !@leg.save
									@leg.errors.full_message.each do |msg|  @errors << msg  end
								end
							end
						end
					else
						@workout.errors.full_message.each do |msg| @errors << msg end
					end
				end
			end
		else
			@week.errors.full_message.each  do |msg|  @errors << msg end
		end

		if !@errors.empty?
			render 'edit'
		else
			redirect_to template_path(params[:template_id])
		end
	end

	private
		def get_week(template_id, sequence)
			if RunningTemplate.exists?(template_id)
				template = RunningTemplate.find(template_id)
				if template.running_template_weeks.exists?(:sequence => sequence)
					return template, template.running_template_weeks.find_by_sequence(sequence)
				end
			end
			redirect_to '/404'
		end
end