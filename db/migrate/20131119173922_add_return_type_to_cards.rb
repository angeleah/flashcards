class AddReturnTypeToCards < ActiveRecord::Migration
  def change
    add_column :cards, :return_type, :string
  end
end
