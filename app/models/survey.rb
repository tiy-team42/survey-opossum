class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :survey_questions
end
