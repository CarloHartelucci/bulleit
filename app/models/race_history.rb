class RaceHistory < ActiveRecord::Base
  	attr_accessible :athlete_id, :race_type, :race_date, :results, :name
  	belongs_to :athlete
end
