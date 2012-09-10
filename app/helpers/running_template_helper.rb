module RunningTemplateHelper
	def edit_week(template, week)
		template_path(template) << "/weeks/#{week.sequence}/edit"
	end

	def update_week(template, week)
		template_path(template) << "/weeks/#{week.sequence}"
	end
end
