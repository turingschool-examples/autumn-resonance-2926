class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    @ingredients = ingredients.order_name
  end
end