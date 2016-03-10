class AddSurveyQuestionIdToLongAnswerQuestions < ActiveRecord::Migration
  def change
    add_column :long_answer_questions, :survey_question_id, :integer
  end
end
