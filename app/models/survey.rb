class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :survey_questions
  accepts_nested_attributes_for :survey_questions,
     reject_if: :all_blank,
     allow_destroy: true
end
