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