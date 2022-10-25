class RecipesIngredientsController < ApplicationController
  def show 
    @recipes = Recipe.find(params[:id])
    @ingredients = @recipes.ingredients
    @total_cost += ingredient.cost
    end
  end
end