class DropdownQuestion < ActiveRecord::Base
  belongs_to :survey_question
  validate :is_required, on: :create
  # before_create :check_answer_exists

  def is_required
    if answer.empty? && survey_question.required
      errors.add(:answer, "This is a required field")
    end
  end

  def check_answer_exists
    if answer.empty?
      false
    else
      true
    end
  end

end
