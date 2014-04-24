class Recipe < ActiveRecord::Base
  belongs_to :category_id
  has_and_belongs_to_many :ingredients

  attr_accessible :freezable, :microwavable, :name, :preparation_time, :serving_size, :category_id_id, :recipe_image

  mount_uploader :recipe_image, RecipeImageUploader

end
