class Sinhvien < ActiveRecord::Base
  attr_accessible :bomon, :giangvien, :ip_source, :malop, :mamon, :masinhvien, :student_name, :survey_id, :tenmon, :vote_date

  validates_presence_of :bomon, :giangvien, :malop, :mamon, :masinhvien, :tenmon
  belongs_to :survey
  has_many :questions, :through => :survey, :dependent => :destroy
  accepts_nested_attributes_for :questions

  validates :survey, presence: true

  scope :by_survey, lambda { |sid|
  	where('survey_id = ?', sid)
  }
  
  scope :by_masinhvien, lambda { |msv|
  	where('masinhvien = ?', msv)
  }
  has_many :ketquas, :dependent => :destroy

  scope :by_voted, where("ip_source = ?", "")
  def voted?
  	return ip_source.length > 0
  end
  def update_voted!
     self.vote_date = DateTime.now
      self.ip_source = @current_ip.to_s    
      self.save!
  end
  def to_s
    "#{self.masinhvien} - #{self.survey} - #{self.giangvien} - #{self.tenmon}"
  end
end
