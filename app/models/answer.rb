class Answer < ActiveRecord::Base
  attr_accessible :answer_text, :display_order, :question_id, :score_point
end
