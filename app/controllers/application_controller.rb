class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_survey

  protected

  def current_survey
  	@current_survey ||= Survey.last
  end
  helper_method :current_survey
end
