class AddRecipeImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_image, :string
  end
end
