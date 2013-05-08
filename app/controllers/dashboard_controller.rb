class DashboardController < ApplicationController

  before_filter :authenticate_user!
  before_filter :current_sinhviens

  
  around_filter :catch_not_found

  def index

  	if @current_sinhviens and !@current_sinhviens.empty? then
	  	@current_sinhvien = @current_sinhviens.first  	
	  	redirect_to(@current_sinhvien) if @current_sinhvien
	  	return
	end
  	
  end
  
  protected
  
  def current_sinhviens
  	@current_sinhviens ||= Sinhvien.by_masinhvien(current_user.masinhvien).by_survey(current_survey.id).by_voted  	
  	puts @current_sinhviens.to_json
  end
  helper_method :current_sinhviens

  def catch_not_found
	yield
  rescue ActiveRecord::RecordNotFound
	redirect_to root_url, :flash => { :error => "Record not found." }
  end
end
