class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :boolean_questions
  has_many :long_answer_questions
  has_many :short_answer_questions
  has_many :dropdown_questions

  accepts_nested_attributes_for :boolean_questions
  accepts_nested_attributes_for :short_answer_questions
  accepts_nested_attributes_for :long_answer_questions
  accepts_nested_attributes_for :dropdown_questions

  validates :question_type, presence: true
  validates :text, presence: true

  def is_boolean?
    question_type == "BooleanQuestion"
  end

  def is_short_answer?
    question_type == "ShortAnswerQuestion"
  end

  def is_long_answer?
    question_type == "LongAnswerQuestion"
  end

  def is_dropdown?
    question_type == "DropdownQuestion"
  end


  def responses
    if is_boolean?
      @responses = boolean_questions.map {|a| a.answer }
    elsif is_short_answer?
      @responses = short_answer_questions.map {|a| a.answer }
    elsif is_long_answer?
      @responses = long_answer_questions.map {|a| a.answer }
    end
    @responses || ["No Responses Yet"]
  end



  def choices
    answer_options.split(",")
  end

end
