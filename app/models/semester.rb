class Semester < ActiveRecord::Base
  attr_accessible :activated, :name

  has_many :surveys, :dependent => :destroy

  validates_presence_of :name
  def to_s
  	"#{self.name}"
  end
end
