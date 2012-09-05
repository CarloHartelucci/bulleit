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
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:9,
			    date: Date.today - Date.today.wday + 1,
			    athlete_id:athlete.id)
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:6,
			    date: Date.today - Date.today.wday + 2,
			    athlete_id:athlete.id)
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:10,
			    date: Date.today - Date.today.wday + 3,
			    athlete_id:athlete.id)
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:6,
			    date: Date.today - Date.today.wday + 4,
			    athlete_id:athlete.id)
Workout.create!(summary:"Off Day",
			    details:"Light stretching",
			    miles:0,
			    date: Date.today - Date.today.wday + 5,
			    athlete_id:athlete.id)
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:13,
			    date: Date.today - Date.today.wday + 6,
			    athlete_id:athlete.id)
Workout.create!(summary:"Easy Run",
			    details:"Easy run, paced between 7:45 - 8:30",
			    miles:5,
			    date: Date.today - Date.today.wday + 7,
			    athlete_id:athlete.id)
