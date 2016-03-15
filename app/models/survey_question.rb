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
      @responses = boolean_questions.map {|a| a.answer ? choices[0] : choices[1]}
    elsif is_short_answer?
      @responses = short_answer_questions.map {|a| a.answer }
    elsif is_long_answer?
      @responses = long_answer_questions.map {|a| a.answer }
    elsif is_dropdown?
      @responses = dropdown_questions.map {|a| a.answer}
    end
    @responses || ["No Responses Yet"]
  end

  def response_stats
    if is_boolean? && responses.count > 0
      number_responses = boolean_questions.group(:answer).count
      total = boolean_questions.count.to_f
      true_stats = (number_responses[true] || 0) / total * 100
      false_stats = (number_responses[false] || 0) / total * 100
      "#{choices[0]}: #{true_stats}%, #{choices[1]}: #{false_stats}% "
    elsif is_dropdown? && responses.count > 0
      number_responses = dropdown_questions.group(:answer).count
      total = dropdown_questions.count.to_f
      choices.map {|c| "#{c} : #{(number_responses[c] || 0) / total * 100}%" }
    else
      responses
    end

  end



  def choices
    answer_options.split(",")
  end

end
