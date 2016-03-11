class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :survey_questions
  has_many :boolean_questions, through: :survey_questions
  has_many :short_answer_questions, through: :survey_questions
  has_many :long_answer_questions, through: :survey_questions



  accepts_nested_attributes_for :survey_questions,
     reject_if: :all_blank,
     allow_destroy: true


end
