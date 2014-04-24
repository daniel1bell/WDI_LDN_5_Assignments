class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serving_size
      t.integer :preparation_time
      t.boolean :freezable
      t.boolean :microwavable
      t.references :category_id

      t.timestamps
    end
    add_index :recipes, :category_id_id
  end
end
