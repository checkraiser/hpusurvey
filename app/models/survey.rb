class Survey < ActiveRecord::Base
  attr_accessible :close_date, :open_date, :semester_id, :title, :year

  belongs_to :semester

  has_many :questions
  has_many :sinhviens

  def to_s
  	"#{self.title}"
  end
end
