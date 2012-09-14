class Athlete < ActiveRecord::Base
  attr_accessible :email, :name, :user_name, :access_token, :fb_user_id
  has_many :schedule_weeks
  has_many :goals
  has_one  :running_history
  has_many :training_paces
  has_many :race_histories

  before_save :create_remember_token

  def today
  	return self.workouts.find_by_date(Date.today)
  end

  def schedule
    return self.schedule_weeks
  end


  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
