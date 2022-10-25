class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.alphabetically_by_name
  end
end