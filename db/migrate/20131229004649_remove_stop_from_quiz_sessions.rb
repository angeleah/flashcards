class RemoveStopFromQuizSessions < ActiveRecord::Migration
  def change
    remove_column :quiz_sessions, :stop
  end
end
