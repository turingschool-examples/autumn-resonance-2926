class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    if params[:ingredient_id] != nil
      @recipe.add_ingredient(params[:ingredient_id])
    end
  end
end