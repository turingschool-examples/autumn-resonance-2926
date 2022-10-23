class RecipesController < ApplicationController
 
  def show 
    @recipes = Recipe.find(params[:id])
  
  end

  def total_cost
    
  end
end