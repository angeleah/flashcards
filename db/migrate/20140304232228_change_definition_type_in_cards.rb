class ChangeDefinitionTypeInCards < ActiveRecord::Migration
  def change
    change_column :cards, :definition, :text
  end
end
