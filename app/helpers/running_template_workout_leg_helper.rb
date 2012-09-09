module RunningTemplateWorkoutLegHelper
	def pace_type(t)
		case t
		when 1 then "easy"
		when 2 then "marathon"
		when 3 then "threshold"
		when 4 then "rep"
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
