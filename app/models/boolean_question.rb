class BooleanQuestion < ActiveRecord::Base
  has_many :survey_questions, as: :question 
end
