class OauthController < ApplicationController
	include OauthHelper

	def login
 		redirect_to oauth_request redirect_uri, session 
	end

	def authorize
		if params[:error].nil?
			profile, @access_token = get_profile redirect_uri, session, params
			@fb_user_id = profile['id']
			@name = profile['name']
			if !profile.nil?
				@athlete = Athlete.find_by_fb_user_id(@fb_user_id)
				if @athlete.nil?
					render :action => "new_athlete"
					return
				else
					@athlete.access_token = @access_token
					@athlete.save
					sign_in @athlete
					redirect_to '/'
					return
				end
			end
		end
		redirect_to '/404'
	end

	def destroy
  		sign_out
  		redirect_to root_path
  	end
end
