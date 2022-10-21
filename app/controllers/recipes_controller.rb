class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def edit
    recipe = Recipe.find(params[:id])
    recipe.ingredients << Ingredient.find(params[:add_ingredient])
    recipe.save
    redirect_to "/recipes/#{recipe.id}"
  end
end