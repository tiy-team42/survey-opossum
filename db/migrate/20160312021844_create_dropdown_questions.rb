class CreateDropdownQuestions < ActiveRecord::Migration
  def change
    create_table :dropdown_questions do |t|
      t.string :answer
      t.integer :survey_question_id

      t.timestamps null: false
    end
  end
end
