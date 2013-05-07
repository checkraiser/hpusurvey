class Answer < ActiveRecord::Base
  attr_accessible :answer_text, :display_order, :question_id, :score_point

  belongs_to :question
  delegate :survey, :to => :question
  def to_s
  	"#{self.answer_text}"
  end
end
