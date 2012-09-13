module DistanceType
	MILES 		=	0
	METERS 		= 	1
	KILOMETERS	=	2

	def DistanceType.toString(t)
		case t
		when 0 then "Miles"
		when 1 then "M"
		when 2 then "kM"
		else ""
		end
	end
end

module PaceType
	EASY 		= 	0
	MARATHON    = 	1
	THRESHOLD 	= 	2
	REP 		=	3

	def PaceType.toString(t)
		case t
		when 0 then "Easy"
		when 1 then "Marathon"
		when 2 then "Threshold"
		when 3 then "Rep"
		else  ""
		end
	end
end
