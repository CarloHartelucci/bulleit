module RunningTemplateWorkoutLegHelper
	def pace_type(t)
		case t
		when 1 then "Easy"
		when 2 then "Marathon"
		when 3 then "Threshold"
		when 4 then "Rep"
		else  ""
		end
	end

	def distance_type(t)
		case t
		when 1 then "miles"
		when 2 then "M"
		when 3 then "kM"
		else ""
		end
	end
end
