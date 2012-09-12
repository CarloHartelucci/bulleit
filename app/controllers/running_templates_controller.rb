class RunningTemplatesController < ApplicationController
	def index
		@templates = RunningTemplate.all
	end

	def show
		@template = get_template(params[:id])
	end

	def new
		@template = RunningTemplate.new
	end

	def create
		@template = RunningTemplate.new(params[:template])
		if @template.save
			(1..@template.number_of_weeks).each do |sequence|
				week = RunningTemplateWeek.create!(running_template_id: @template.id,
												   sequence: sequence,
												   distance_percent: 100)
				(1..2).each do |sequence|
					RunningTemplateWorkout.create(running_template_week_id: week.id)
				end
			end

			redirect_to template_path(@template.id)
		else
			render 'new'
		end

	end

	def edit
		@template = get_template(params[:id])
	end

	def update
		@template = get_template(params[:id])
		if !@template.update_attributes(params[:template])
			render 'edit'
		else
			redirect_to template_path(@template.id)
		end
	end

	def destroy
		@template = get_template(params[:id])
		if @template.delete
			redirect_to templates_path
		else
			render 'delete'
		end
	end

	def new_instance
		@template = get_template(params[:id])
		@athletes = Athlete.all
	end

	def create_instance
		@template = get_template(params[:id])
		@athlete = Athlete.find(params[:athlete])

		schedule = []
		params[:day].each do |key, day|
			if day[:type] == "easy"
				schedule[key.to_i] = day[:context].to_f / 100
			else 
				schedule[key.to_i] = day[:type]
			end
		end

		@template.generate(@athlete, params[:race_date].to_date, schedule)
		redirect_to templates_path
	end


	private
		def get_template(id)
			if RunningTemplate.exists?(id)
				RunningTemplate.find(id)
			else
				redirect_to '/404'
			end
		end
end
