class SinhvienController < DashboardController
  
  
  before_filter :get_survey
  before_filter :current_sinhviens
  before_filter :get_sinhvien

  before_filter :check_complete, :only => [:update]


  def show  	  	  	  	
  	redirect_to(root_path) unless @current_sinhvien  	
  end

  def update
  	  @current_sinhvien.vote_date = DateTime.now
	  	@current_sinhvien.ip_source = @current_ip.to_s	  
	  	@current_sinhvien.save	 

	  	

	  	@radio_answers.each do |k,v|
	  		Ketqua.create(:answer_id => v.to_i, :sinhvien_id => @current_sinhvien.id)
	  	end
	  	@text_answers.each do |k,v|
	  		Ketqua.create(:answer_text => v.to_s, :sinhvien_id => @current_sinhvien.id)
	  	end

	  	check_condition 	
  end
  protected
	  def check_complete
	  	@myparams = params.select {|k,v| v != nil and !v.empty?  }

	  	@radio_answers = @myparams.select {|k,v| k.include?('_radio_')}
	  	@text_answers = @myparams.select {|k,v| k.include?('_text_')}
	  	@radio_questions = @current_survey.questions.select { |q| q.question_type_id == 1}


	  	if @radio_answers.size < @radio_questions.size then
			redirect_to @current_sinhvien  , :flash => { :error => "Please complete." }
			return
	    end 
  	  end

  	  def current_sinhviens
	  	@current_sinhviens ||= Sinhvien.by_masinhvien(current_user.masinhvien).by_survey(current_survey.id).by_voted  	
	  end
  	  def get_sinhvien  	  	
  	  	sv = Sinhvien.find(params[:id])
  	  	if !sv.voted? then
  	  		@current_sinhvien = sv 
  	  	else
  	  		@current_sinhvien = nil
  	  	end
  	  end
	 
	  def get_survey
	  	@current_survey ||= @current_sinhvien.survey
	  end

	private
	  def check_condition	  	
		if !@current_sinhviens.empty? then 
	  		@current_sinhvien = @current_sinhviens.first
	  		redirect_to(@current_sinhvien)	  		
	  	else
	  		redirect_to root_path  , :flash => { :notice => "No survey found." }
	  		return
	  	end
	  end
 	
end
