class Semester < ActiveRecord::Base
  attr_accessible :activated, :name

  has_many :surveys

  def to_s
  	"#{self.name}"
  end
end
