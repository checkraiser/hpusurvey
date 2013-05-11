class Survey < ActiveRecord::Base
  attr_accessible :close_date, :open_date, :title, :year, :activated

  validates_presence_of :title, :open_date, :close_date

  has_many :questions, :dependent => :destroy
  has_many :sinhviens, :dependent => :destroy
  accepts_nested_attributes_for :questions


  default_scope where(:activated => true)
  def to_s
  	"#{self.title}"
  end
  def is_voted?(user)
  	svs = Sinhvien.by_masinhvien(user.masinhvien).by_survey(self.id).by_voted  	
  	return svs.empty?
  end

  
end
