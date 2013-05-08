class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_survey
  before_filter :current_ip
  protected

  def current_survey
  	@current_survey ||= Survey.last
  end
  helper_method :current_survey
  def current_ip
  	@current_ip = request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end
end
