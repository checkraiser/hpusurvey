class Sinhvien < ActiveRecord::Base
  attr_accessible :bomon, :giangvien, :ip_source, :malop, :mamon, :masinhvien, :student_name, :survey_id, :tenmon, :vote_date

  validates_presence_of :bomon, :giangvien, :malop, :mamon, :masinhvien, :tenmon
  belongs_to :survey
  def voted?
  	return self.vote_date.is_a? DateTime
  end
end
