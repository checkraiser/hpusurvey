class QuestionType < ActiveRecord::Base
  attr_accessible :type

  def to_s
  	"#{self.type}"
  end
end
