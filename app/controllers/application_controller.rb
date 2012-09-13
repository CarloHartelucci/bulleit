require 'constants'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  RunningTemplateWorkoutLegHelper
end
