# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Athlete.delete_all
athlete = Athlete.create!(name:"Charlie Hartel",
					  	  email:"charliehartel@gmail.com",
					  	  user_name:"charliehartel",
					  	  fb_user_id:"529379274")
Workout.delete_all
WorkoutLeg.delete_all
ScheduleWeek.delete_all

Goal.delete_all
Goal.create(name:"Qualify for Boston Marathon",
			race:"Philadelphia Marathon",
			distance:26.2,
			goal_time:"03:00:00",
			date:Date.new(2012, 11, 4),
			athlete_id:athlete.id)

TrainingPace.delete_all
TrainingPace.create(athlete_id:athlete.id,
					pace_type:1,
					min_pace:"7:45",
					max_pace:"8:30")
TrainingPace.create(athlete_id:athlete.id,
					pace_type:2,
					min_pace:"7:03")
TrainingPace.create(athlete_id:athlete.id,
					pace_type:3,
					min_pace:"6:40")
TrainingPace.create(athlete_id:athlete.id,
					pace_type:4,
					min_pace:"6:10")

running_template = 
	{ 
		name: "15 Week Marathon",
		distance: 26.2,
		distance_type: 0,
		level: 2,
		number_of_weeks: 15,
		distance_per_week: 45,
		runs_per_week: 5,
		weeks: 
			[
				{
					multiplier: 95, sequence:1, 
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 7,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 4,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							  ]  
				},
			  	{
			  		multiplier: 100, sequence:2,
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 12,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 4,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]
			  	},
			  	{
			  		multiplier: 85, sequence:3,
					workouts: [
								{
									distance: 10,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 6,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 4,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]
			  	},
			  	{
			  		multiplier: 100, sequence:4,
					workouts: [
								{
									distance: 14,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 14,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 5,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}  
							]
				},
			  	{
			  		multiplier: 95, sequence:5,
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 4,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 4,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 4,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}  
							]
				},
			  	{
			  		multiplier: 85, sequence:6,
					workouts: [
								{
									distance: 10,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 7,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 5,
												recovery: 60
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]  
			  	},
			  	{
			  		multiplier: 100, sequence:7,
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 12,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2,
												recovery: 120
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]    
			  	},
			  	{
			  		multiplier: 95, sequence:8,
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 12,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2,
												recovery: 120
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]  
			  	},
			  	{
			  		multiplier: 95, sequence:9,
					workouts: [
								{
									distance: 10,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 10,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Marathon Pace/Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2,
												recovery: 120
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]  
			  	},
			  	{
			  		multiplier: 100, sequence:10,
					workouts: [
								{
									distance: 16,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 16,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 3,
												recovery: 180
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							] 
			  	},
			  	{
			  		multiplier: 100, sequence:11,
					workouts: [
								{
									distance: 12,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 4,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 4,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 3,
												recovery: 180
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							] 
			  	},
			  	{
			  		multiplier: 95, sequence:12,
					workouts: [
								{
									distance: 10,
									distance_type: 0,
									description: "Marathon Pace Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 2
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 3,
												recovery: 180
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3,
												repetitions: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]   
			  	},
			  	{
			  		multiplier: 90, sequence:13,
					workouts: [
								{
									distance: 17,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 17,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 8,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 5,
												recovery: 60
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]   
			  	},
			  	{
			  		multiplier: 100, sequence:14,
					workouts: [
								{
									distance: 10,
									distance_type: 0,
									description: "Long Run",
									legs: [
											{
												distance: 10,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								},
								{
									distance: 7,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 3,
												distance_type: 0,
												pace_type: 3,
												recovery: 180
											},
											{
												distance: 2,
												distance_type: 0,
												pace_type: 3
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]   
			  	},
			  	{
			  		multiplier: 100, sequence:15,
					workouts: [
								{
									distance: 26.2,
									distance_type: 0,
									description: "Race Day",
									legs: [
											{
												distance: 26.2,
												distance_type: 0,
												pace_type: 2
											}
										  ]
								},
								{
									distance: 6,
									distance_type: 0,
									description: "Threshold Session",
									legs: [
											{
												distance: 2,
												distance_type: 0,
												pace_type: 1
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 3,
												repetitions: 3,
												recovery: 120
											},
											{
												distance: 1,
												distance_type: 0,
												pace_type: 1
											}
										  ]
								}
							]   
			  	}

			]
	}

RunningTemplate.delete_all
RunningTemplateWeek.delete_all
RunningTemplateWorkout.delete_all
RunningTemplateWorkoutLeg.delete_all

template = 
	RunningTemplate.create!(:name => running_template[:name], 
						   :distance => running_template[:distance], 
						   :distance_per_week => running_template[:distance_per_week], 
						   :distance_type => running_template[:distance_type], 
						   :level => running_template[:level], 
						   :number_of_weeks => running_template[:number_of_weeks],
						   :runs_per_week => running_template[:runs_per_week])

running_template[:weeks].each do |w|
	week = 
		RunningTemplateWeek.create!(:running_template_id => template.id, 
							   		:distance_percent => w[:multiplier], 
							   		:sequence => w[:sequence])
	w[:workouts].each do |wo|
		workout =
			RunningTemplateWorkout.create!(:running_template_week_id => week.id, 
										   :total_distance => wo[:distance], 
										   :distance_type => wo[:distance_type],
										   :description => wo[:description])

		sequence = 0
		wo[:legs].each do |l|
			leg = 
				RunningTemplateWorkoutLeg.create!(running_template_workout_id: workout.id,
												  distance: l[:distance],
												  distance_type: l[:distance_type],
												  pace_type: l[:pace_type],
												  repetitions: l[:repetitions],
												  recovery: l[:recovery],
												  sequence: sequence)
			sequence += 1
		end

	end
end


