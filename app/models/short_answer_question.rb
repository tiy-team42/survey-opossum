class ShortAnswerQuestion < ActiveRecord::Base
  has_many :survey_questions, as: :question 
end
