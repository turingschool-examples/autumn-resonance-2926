class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    require 'pry'; binding.pry
    # ingredient = Ingredient.find(params["name"])
    redirect_to "/recipes/#{recipe.id}"
  end
  
end