class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_cost = @recipe.total_cost
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if params[:ingredient] != nil
      ingredient = Ingredient.find_by(name: params[:ingredient])
      @recipe.ingredients << ingredient
    end
    redirect_to "/recipes/#{params[:id]}"
  end
end