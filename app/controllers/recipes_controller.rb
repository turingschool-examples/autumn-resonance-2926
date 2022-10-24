class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.all
  end
end