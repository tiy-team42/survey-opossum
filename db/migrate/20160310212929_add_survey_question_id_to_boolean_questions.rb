class AddSurveyQuestionIdToBooleanQuestions < ActiveRecord::Migration
  def change
    add_column :boolean_questions, :survey_question_id, :integer
  end
end
