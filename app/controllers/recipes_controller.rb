class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.ingredients
    @total_cost = sum_of_ingredient_cost
  end

  def sum_of_ingredient_cost
    @recipe_ingredients.sum {|ingredient| ingredient.cost}
  end
end