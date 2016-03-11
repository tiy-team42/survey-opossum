require 'test_helper'

class SurveyQuestionTest < ActiveSupport::TestCase
  test "can determine question type" do
    q = SurveyQuestion.create(question_type: "BooleanQuestion")
    assert q.is_boolean?
    q2 = SurveyQuestion.create(question_type: "ShortAnswerQuestion")
    assert q2.is_short_answer?
    q3 = SurveyQuestion.create(question_type: "LongAnswerQuestion")
    assert q3.is_long_answer?
  end

  test "can get answer options" do
    q = SurveyQuestion.create(question_type: "BooleanQuestion", answer_options: "Kinda, Not Really")
    assert_equal "Kinda", q.choices[0]
  end

end
