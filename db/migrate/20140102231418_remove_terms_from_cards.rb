class RemoveTermsFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :term
  end
end
