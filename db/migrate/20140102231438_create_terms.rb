class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term
      t.integer :card_id
    end
  end
end
