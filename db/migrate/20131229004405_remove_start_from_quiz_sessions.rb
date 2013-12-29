class RemoveStartFromQuizSessions < ActiveRecord::Migration
  def change
    remove_column :quiz_sessions, :start
  end
end
