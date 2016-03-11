require 'test_helper'

class SurveyTest < ActiveSupport::TestCase

  test "can find out if a survey has boolean responses" do
    s = Survey.create
    q = SurveyQuestion.create(question_type: "BooleanQuestion", answer_options: "Kinda, Not Really", survey_id: s.id)
    b = BooleanQuestion.create(answer: "true", survey_question_id: q.id)
    assert s.has_responses?
  end

  test "can find out if a survey has short answer responses" do
    s = Survey.create
    q = SurveyQuestion.create(question_type: "ShortAnswerQuestion", survey_id: s.id)
    a = ShortAnswerQuestion.create(answer: "yep!", survey_question_id: q.id)
    assert s.has_responses?
  end

  test "can find out if a survey has long answer responses" do
    s = Survey.create
    q = SurveyQuestion.create(question_type: "LongAnswerQuestion", survey_id: s.id)
    a = LongAnswerQuestion.create(answer: "yep!", survey_question_id: q.id)
    assert s.has_responses?
  end

  test "can find out if a survey has no responses" do
    s = Survey.create
    q = SurveyQuestion.create(question_type: "LongAnswerQuestion", survey_id: s.id)
    refute s.has_responses?
  end


end
