class Ketqua < ActiveRecord::Base
  attr_accessible :answer_id, :answer_text, :sinhvien_id

  belongs_to :answer
  belongs_to :sinhvien
end
