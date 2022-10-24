class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    recipe_ingredients = RecipeIngredient.where("recipe_id = #{@recipe.id}")
    @ingredients = recipe_ingredients.map do |recipe|
      Ingredient.where(id: recipe.ingredient_id)
    end
    @ingredients_cost = recipe_ingredients.map do |recipe|
      Ingredient.where(id: recipe.ingredient_id).sum(:cost)
    end.sum
  end
end