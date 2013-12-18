class AddObjectTypeToQuizSessions < ActiveRecord::Migration
  def change
    add_column :quiz_sessions, :object_type, :string
  end
end
