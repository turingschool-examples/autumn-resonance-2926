class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_cost = @recipe.total_cost
  end
end