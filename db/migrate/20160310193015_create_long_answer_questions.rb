class CreateLongAnswerQuestions < ActiveRecord::Migration
  def change
    create_table :long_answer_questions do |t|
      t.text :answer

      t.timestamps null: false
    end
  end
end
