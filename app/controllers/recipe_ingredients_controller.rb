class RecipeIngredientsController < ApplicationController
  def add_ingredient
    require 'pry'; binding.pry
    # ingredient = Ingredient.find(params[:name])
    recipe = Recipe.find(params[:recipe_id])
    RecipeIngredient.create!(ingredient_id: ingredient.id, recipe_id: recipe.id)
    require 'pry'; binding.pry
    redirect_to "/recipes/#{recipe.id}"
  end
  
end