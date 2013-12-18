?s
--
<!-- - stubbing time for calculations? use Timecop -->

- how do I test for the case when my model is not persisted?

class CreateQuizSessionQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_session_questions do |t|
      t.integer :card_id
      t.integer :quiz_session_id
      t.boolean :correct
      t.integer :user_id

      t.timestamps
    end
  end
end


class Stats < ActiveRecord::Base
  belongs_to :quiz_session
  belongs_to :user

  validates :user_id, :card_id, :quiz_session_id, presence: true
end
