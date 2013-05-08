class SinhvienController < DashboardController
  
  around_filter :catch_not_found
  before_filter :get_sinhvien
  before_filter :get_survey
  def show

  end

  def update
  	@val = params[:sinhvien][:questions_attributes].to_s
  end
  protected

	  def get_sinhvien
	  	@current_sinhvien ||= Sinhvien.find(params[:id])
	  end
	  def get_survey
	  	@current_survey ||= @current_sinhvien.survey
	  end

  private

	def catch_not_found
	  yield
	rescue ActiveRecord::RecordNotFound
	  redirect_to root_url, :flash => { :error => "Record not found." }
	end
end
