class RecipesController < ApplicationController
  def show 
    @recipe = Recipe.find(params[:id])
    if params[:commit] == "Search"
      @search_ingredients = Ingredient.find(params[:search_ingredients])

    end
  end

  def update 
    
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    redirect_to '/recipes'
  end


  private 
  def recipe_params
    params.permit(:name, :complexity, :genre)
  end




end