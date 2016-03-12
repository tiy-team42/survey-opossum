class LongAnswerQuestion < ActiveRecord::Base
  belongs_to :survey_question
  validate :is_required, on: :create

  def is_required
    errors.add(:answer, "This is a required field") unless !survey_question.required
  end

end
