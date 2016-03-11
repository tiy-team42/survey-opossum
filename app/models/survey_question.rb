class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :boolean_questions
  has_many :long_answer_questions
  has_many :short_answer_questions

  accepts_nested_attributes_for :boolean_questions
  accepts_nested_attributes_for :short_answer_questions
  accepts_nested_attributes_for :long_answer_questions

end
