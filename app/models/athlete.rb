class Athlete < ActiveRecord::Base
  attr_accessible :email, :name, :user_name, :access_token, :fb_user_id

  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
