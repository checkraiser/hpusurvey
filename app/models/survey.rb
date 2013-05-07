class Survey < ActiveRecord::Base
  attr_accessible :close_date, :open_date, :semester_id, :title, :year
end
