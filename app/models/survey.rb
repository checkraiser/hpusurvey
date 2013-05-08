class Survey < ActiveRecord::Base
  attr_accessible :close_date, :open_date, :semester_id, :title, :year, :activated

  validates_presence_of :title, :open_date, :close_date
  belongs_to :semester

  has_many :questions
  has_many :sinhviens
  accepts_nested_attributes_for :questions
  
  def to_s
  	"#{self.title}"
  end
end
