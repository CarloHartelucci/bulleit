class RunningTemplatesController < ApplicationController
	def index
		@templates = RunningTemplate.all
	end

	def show
		@template =get_template(params[:id])
	end

	def new

	end

	def create

	end

	def edit
		@template = get_template(params[:id])
	end

	def update
		@template = get_template(params[:id])
		if !@template.update_attributes(params[:template])
			redirect_to '/500'
		else
			redirect_to running_template_path(@template.id)
		end
	end

	def delete

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
