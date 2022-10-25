class RecipeIngredientsController < ApplicationController
  def create 
    RecipeIngredient.create(rec_ing_params)
    redirect_to "/recipes/#{params[:recipe_id]}"
  end

  private 

  def rec_ing_params
    params.permit(:ingredient_id, :recipe_id)
  end
end