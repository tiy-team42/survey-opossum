class AddQuestionOptionsToSurveyQuestions < ActiveRecord::Migration
  def change
    add_column :survey_questions, :answer_options, :string
  end
end
