class Answer < ActiveRecord::Base
  attr_accessible :answer_text, :question_id, :score_point, :display_order

  

  belongs_to :question
  delegate :survey, :to => :question
  def to_s
  	"#{self.answer_text}"
  end
  before_save :set_display_order
  protected
  def set_display_order
  	self.display_order = Answer.count + 1
  end
end
