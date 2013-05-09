class Survey < ActiveRecord::Base
  attr_accessible :close_date, :open_date, :semester_id, :title, :year, :activated

  validates_presence_of :title, :open_date, :close_date
  belongs_to :semester
  validates :semester, presence: true
  has_many :questions, :dependent => :destroy
  has_many :sinhviens, :dependent => :destroy
  accepts_nested_attributes_for :questions
  
  def to_s
  	"#{self.title}"
  end
end
