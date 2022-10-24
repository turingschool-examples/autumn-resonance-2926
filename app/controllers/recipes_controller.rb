class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    recipe_ingredients = RecipeIngredient.where("recipe_id = #{@recipe.id}")
    @ingredients = recipe_ingredients.flat_map do |recipe|
      Ingredient.where(id: recipe.ingredient_id)
    end
    @ingredients_cost = Recipe.total_cost(@ingredients)
  end
end