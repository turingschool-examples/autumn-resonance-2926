class RecipesController < ApplicationController

  def show

    @recipe = Recipe.find(params[:id])

    if params[:ingredient_id].present?
      ingredient = Ingredient.find(params[:ingredient_id])
      @recipe.ingredients << ingredient
    end
  end
end
