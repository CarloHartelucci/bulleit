module ScheduleHelper
	def day_of_week(wday)
		case wday
		when 0 then "Sunday"
		when 1 then "Monday"
		when 2 then "Tuesday"
		when 3 then "Wednesday"
		when 4 then "Thursday"
		when 5 then "Friday"
		when 6 then "Saturday"
		else ""
		end
	end
end
