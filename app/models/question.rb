class Question < ActiveRecord::Base
  attr_accessible :display_order, :question_text, :question_type_id, :required, :survey_id

  belongs_to :question_type
  belongs_to :survey

  def to_s
  	"#{self.question_text}"
  end
end
