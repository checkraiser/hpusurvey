class QuestionType < ActiveRecord::Base
  attr_accessible :type_name
  validates_presence_of :type_name
  def to_s
  	"#{self.type_name}"
  end
end
