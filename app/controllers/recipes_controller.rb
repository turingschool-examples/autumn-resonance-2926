class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.ingredients
    @total_cost = sum_of_ingredient_cost
  end

  def sum_of_ingredient_cost
    @recipe_ingredients.sum {|ingredient| ingredient.cost}
  end

  def update
    recipe = Recipe.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    recipe.ingredients << ingredient
    redirect_to "/recipes/#{recipe.id}"
  end
end