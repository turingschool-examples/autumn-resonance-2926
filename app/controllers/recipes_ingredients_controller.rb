class RecipesIngredientsController < ApplicationController
  def show 
    @recipes = Recipe.find(params[:id])
    @ingredients = @recipes.ingredients
  end
end