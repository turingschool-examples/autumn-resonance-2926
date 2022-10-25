class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    return @recipe unless params[:ingredient_id].present?

    new_ingredient = Ingredient.find(params[:ingredient_id])
    @recipe.ingredients.push(new_ingredient)
  end
end
