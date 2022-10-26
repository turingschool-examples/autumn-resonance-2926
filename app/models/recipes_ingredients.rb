class RecipesIngredients < ApplicationRecord
  belongs_to :recipes
  belongs_to :ingredient  
end