class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :boolean_questions
end
