class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sorted_alphabetically
  end
end
