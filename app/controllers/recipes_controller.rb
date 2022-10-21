class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])

    if params[:new_ing]
      RecipeIngredient.create!(recipe: @recipe, ingredient: Ingredient.find(params[:new_ing].to_i))
    end
  end
end