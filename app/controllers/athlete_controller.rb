class AthleteController < ApplicationController
	def create
		@athlete = Athlete.new(name:params[:name],
							   fb_user_id:params[:fb_user_id],
							   email:params[:email],
							   user_name:params[:user_name],
							   access_token:params[:access_token])
		if !@athlete.save
			redirect_to '/404'
		else
			sign_in @athlete
			redirect_to '/'
		end
	end
end
