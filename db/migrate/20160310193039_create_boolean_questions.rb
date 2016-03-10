class CreateBooleanQuestions < ActiveRecord::Migration
  def change
    create_table :boolean_questions do |t|
      t.boolean :answer

      t.timestamps null: false
    end
  end
end
