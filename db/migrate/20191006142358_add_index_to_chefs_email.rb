class AddIndexToChefsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :chefs, :email, unique: true
  end
end
