class RemoveQuestionIdFromSurveyQuestions < ActiveRecord::Migration
  def change
    remove_column :survey_questions, :question_id, :integer
  end
end
