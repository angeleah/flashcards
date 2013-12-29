class AddCategoryToQuizSessions < ActiveRecord::Migration
  def change
    add_column :quiz_sessions, :category, :string
  end
end
