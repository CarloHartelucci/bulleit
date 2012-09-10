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

	private
		def get_template(id)
			if RunningTemplate.exists?(id)
				RunningTemplate.find(id)
			else
				redirect_to '/404'
			end
		end
end
