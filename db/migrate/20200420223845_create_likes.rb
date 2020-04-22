class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :chef, foreign_key: true
      t.references :recipe, foreign_key: true
      
      t.timestamps
    end
  end
end
