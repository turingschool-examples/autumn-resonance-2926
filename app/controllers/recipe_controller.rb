class RecipeController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredient_list = @recipe.needed_ingredients
  end
end