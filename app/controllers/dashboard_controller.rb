class DashboardController < ApplicationController

  before_filter :authenticate_user!
  before_filter :current_sinhviens
  def index
  end

  protected
  def current_sinhviens
  	@current_sinhviens ||= Sinhvien.by_masinhvien(current_user.masinhvien).by_survey(current_survey.id)
  end
  helper_method :current_sinhviens
end
