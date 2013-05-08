class Question < ActiveRecord::Base
  attr_accessible :question_text, :question_type_id, :required, :survey_id, :display_order

  validates_presence_of :question_text
  
  
  belongs_to :question_type
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank

  before_save :set_display_order
  after_create :create_default_answer
  def to_s
  	"#{self.question_text}"
  end
  def is_radio?
    question_type_id == 1
  end
  def is_text?
    question_type_id == 2
  end
  protected
  def set_display_order
  	self.display_order = Question.count + 1
  end
  def create_default_answer
  	if self.question_type_id == 2 then
  		Answer.create!(:question_id => self.id, :answer_text => "", :display_order => 1, :score_point => 0)
  	end
  end

end
