class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def self.find_recipe 
    @recipe = Recipe_ingredient.find(params[:id]) 
  end
end