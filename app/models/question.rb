class Question < ActiveRecord::Base
  attr_accessible :display_order, :question_text, :question_type_id, :required, :survey_id
end
