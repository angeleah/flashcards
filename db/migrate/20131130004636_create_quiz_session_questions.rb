class CreateQuizSessionQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_session_questions do |t|
      t.integer :card_id
      t.integer :user_id
      t.boolean :correct
      t.integer :quiz_session_id

      t.timestamps
    end
  end
end
