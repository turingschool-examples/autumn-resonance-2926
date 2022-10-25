class IngredientController < ApplicationController
  def index
    @ingredients = Ingredient.order_alphabetically
  end
end