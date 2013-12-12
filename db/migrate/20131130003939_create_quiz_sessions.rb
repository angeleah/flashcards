class CreateQuizSessions < ActiveRecord::Migration
  def change
    create_table :quiz_sessions do |t|
      t.integer :user_id
      t.time :start
      t.time :stop

      t.timestamps
    end
  end
end
