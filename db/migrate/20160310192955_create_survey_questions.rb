class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :text
      t.integer :question_id
      t.string :question_type
      t.boolean :required
      t.integer :survey_id

      t.timestamps null: false
    end
  end
end
