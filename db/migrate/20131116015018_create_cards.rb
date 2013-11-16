class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term
      t.string :definition
      t.string :object_type
      t.text :example

      t.timestamps
    end
  end
end
