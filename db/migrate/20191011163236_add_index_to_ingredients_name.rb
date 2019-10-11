class AddIndexToIngredientsName < ActiveRecord::Migration[5.2]
  def change
    add_index :ingredients, :name, unique: true
  end
end
