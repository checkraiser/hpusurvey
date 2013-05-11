class ApplicationController < ActionController::Base
  protect_from_forgery

  
  before_filter :current_ip
  protected

  
  def current_ip
  	@current_ip = request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end
end
