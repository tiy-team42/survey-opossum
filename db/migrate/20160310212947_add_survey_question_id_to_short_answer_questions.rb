class AddSurveyQuestionIdToShortAnswerQuestions < ActiveRecord::Migration
  def change
    add_column :short_answer_questions, :survey_question_id, :integer
  end
end
