class CreateShortAnswerQuestions < ActiveRecord::Migration
  def change
    create_table :short_answer_questions do |t|
      t.string :answer

      t.timestamps null: false
    end
  end
end
