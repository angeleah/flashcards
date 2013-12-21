class RenameQuizSessionQuestionsToQuestions < ActiveRecord::Migration
  def change
    rename_table :quiz_session_questions, :questions
  end
end
