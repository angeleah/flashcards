class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :card_id
      t.integer :user_id
      t.boolean :result
      t.integer :quiz_session_id

      t.timestamps
    end
  end
end
