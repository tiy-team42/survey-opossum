class LongAnswerQuestion < ActiveRecord::Base
  belongs_to :survey_question
  validate :is_required, on: :create

  def is_required
    if answer.empty? && survey_question.required
      errors.add(:answer, "This is a required field")
    end
  end

end
