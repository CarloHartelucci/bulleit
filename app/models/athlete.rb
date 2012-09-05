class Athlete < ActiveRecord::Base
  attr_accessible :email, :name, :user_name, :access_token, :fb_user_id
  has_many :workouts

  before_save :create_remember_token

  def current_week
  	schedule = []
    for i in 1...8
      if Date.today.wday == 0
        day = Date.today - 7 + i
      else
      	day = Date.today - Date.today.wday + i
      end
      
      workout = self.workouts.find_by_date(day)
      schedule << workout
    end
    return schedule
  end

  def today
  	return self.workouts.find_by_date(Date.today)
  end


  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
